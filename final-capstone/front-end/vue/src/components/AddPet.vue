<template>
<div id="register">
    <form v-on:submit.prevent="submitPetForm">
        <div class="field">
            <label for="name">Name</label>
            <input 
                type="text" 
                name="name" 
                placeholder="Name"
                v-model="pet.petName"
                required
            />
        </div>
        <div class="field">
            <label for="age">Age</label>
            <input 
                type="number" 
                name="age" 
                placeholder="Age"
                v-model="pet.age"
            />
        </div>
        <div class="field">
            <label for="name">Type</label>
            <select id="type" name="type" placeholder="Type" v-model="pet.petType" required>
                <option value="Dog">Dog</option>
                <option value="Cat">Cat</option>
                <option value="Bird">Bird</option>
                <option value="Reptile">Reptile</option>
                <option value="Other">Other</option>
            </select>
        </div>
         <div class="field">
            <label for="breed">Breed</label>
            <input 
                type="text" 
                name="breed" 
                placeholder="Breed"
                v-model="pet.breed"
            />
        </div>
        <div class="field">
            <label for="size">Size</label>
            <input 
                type="text" 
                name="size" 
                placeholder="Size"
                v-model="pet.size"
            />
        </div>
        <div class="field">
            <label for="gender">Gender</label>
            <input 
                type="text" 
                name="gender" 
                placeholder="Gender"
                v-model="pet.gender"
            />
        </div>
        <div class="field">
            <label for="name">Personality</label>
            <select id="personality" name="personality" placeholder="Personality" v-model="pet.personalityType" required>
                <option value="" disabled selected hidden>Personality</option>
                <option value="Shy, Timid">Shy, Timid</option>
                <option value="Friendly, Sweet">Friendly, Sweet</option>
                <option value="Loving, Affectionate">Loving, Affectionate</option> 
                <option value="Curious, Adventurous">Curious, Adventurous</option>
                <option value="Gentle, Laidback">Gentle, Laidback</option>
                <option value="Active, Playful">Active, Playful</option>
                <option value="Confident, String-Willed">Confident, Strong-Willed</option>
            </select>
        </div>
        <div class="field">
            <label for="bio">Bio</label>
            <input 
                type="text"
                name="bio" 
                placeholder="Bio"
                v-model="pet.description"
            />
        </div>
        <div class="field">
            <label for="image">Profile Photo</label>
            <vue-dropzone
                id="dropzone"
                class="mt-3"
                v-bind:options="dropzoneOptions"
                v-on:vdropzone-sending="addFormData"
                v-on:vdropzone-success="getSuccess"
                :useCustomDropzoneOptions="true"
            ></vue-dropzone>
        </div>
        <br/>
        <div class="actions">
            <button type="submit" v-on:click="submitPetForm">Submit</button>
        </div>
        <br/>
        <br/>
        <br/>
    </form>
</div>
</template>

<script>
import applicationServices from "@/services/ApplicationServices";
import vue2Dropzone from "vue2-dropzone";
import "vue2-dropzone/dist/vue2Dropzone.min.css";

export default {
    //name: "add-pet",
    name: "upload-photo",
    components: {
        vueDropzone: vue2Dropzone
    },
    created() {
        this.setProfileId();
        this.setPetId();
    },
    data() {
        return {
            selectedFile: null,
            pet: {
                petId: null,
                profileId: null,
                petName: "",
                age: "",
                petType: "",
                breed: "",
                size:"",
                gender: "",
                personalityType: "",
                description: "",
                profilePhoto: ""
            },
            errorMsg: "",
            dropzoneOptions: {
                url: "https://api.cloudinary.com/v1_1/ashdav/image/upload",  
                thumbnailWidth: 250,
                thumbnailHeight: 250,
                maxFilesize: 2.0,
                acceptedFiles: ".jpg, .jpeg, .png, .gif",
                uploadMultiple: false,
                addRemoveLinks: true,
                dictDefaultMessage: 'Drop files here to upload. </br> Alternatively, click to select a file for upload.',                
            }, 
        };
    },
    methods: {
        setProfileId() {
            this.pet.profileId = this.$store.state.profile.profileId;
        },
        setPetId() {
            if (this.$store.state.pet.petId != null) {
                this.pet.petId = this.$store.state.pet.petId;
            }
            else {
                this.pet.petId = 0;
            }
        },
        submitPetForm() {
            const newPet = this.pet;
            if (this.pet.petId === 0) {
                applicationServices
                    .addPet(newPet)
                    .then(response => {
                        if(response.status === 200) {
                            this.$store.commit("SET_PET", response.data);
                            this.$router.push(`/profile/${this.$store.state.profile.profileId}`);
                        }
                    })
                    .catch(error => {
                        this.handleErrorResponse(error, "updating");
                    });
            } else {
                applicationServices
                    .updatePetProfile(newPet)
                    .then(response => {
                        if(response.status === 200) {
                            this.$router.push(`/profile/${this.$store.state.profile.profileId}`)
                        }
                    })
                    .catch(error => {
                        this.handleErrorResponse(error, "Updating")
                    })
            }
        },
        handleErrorResponse(error, verb) {
            if (error.response) {  
            this.errorMsg =                                     
                "Error " + verb + " card. Response received was '" + 
                error.response.statusText +                   
                "'.";                                            
            } else if (error.request) {     
                this.errorMsg =                                         
                "Error " + verb + " card. Server could not be reached.";  
            } else {                       
                this.errorMsg =                                            
                "Error " + verb + " card. Request could not be created."; 
            }
        },
        addFormData(file, xhr, formData) {
            formData.append("api_key", "657265325953443");                // substitute your api key
            formData.append("upload_preset", "pfjwkuav");   // substitute your upload preset
            formData.append("timestamp", (Date.now() / 1000) | 0);
            formData.append("tags", "vue-app");
        },
         /******************************************************************************************
         * The getSuccess method is called when vdropzone-success event is fired
         ******************************************************************************************/
        getSuccess(file, response) {
            const imgUrl = response.secure_url;   // store the url for the uploaded image
            this.pet.profilePhoto = response.secure_url;
            this.$emit("image-upload", imgUrl);   // fire custom event with image url in case someone cares
        },
    },
    computed: {
        profile() {
            return this.$store.state.profile;
        },
    }
}
</script>

<style scoped>
#register {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; 
    grid-template-areas: 
        ". form .";
}
form {
    grid-area: form;
    line-height: 20px;
}
input {
    width: 100%;
    padding: 10px 10px;
    margin: 8px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
}
.field {
    margin: 5px 0;
}
label {
    font-weight: bold;
    color: #555555;
}
select {
    width: 100%;
    padding: 10px 10px;
    margin: 8px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
}
button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    background-color: #29d2db;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
</style>