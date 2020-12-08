<template>
<div id="register">
    <form v-on:submit.prevent>
        <div class="field">
            <label for="name">Name</label>
            <input type="text" name="name" v-model="pet.petName"/>
        </div>
        <div class="field">
            <label for="age">Age</label>
            <input type="number" name="age" v-model="pet.age"/>
        </div>
        <div class="field">
            <label for="name">Type</label>
            <select id="type" name="type" v-model="pet.petType">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="bird">Bird</option>
                <option value="reptile">Reptile</option>
                <option value="other">Other</option>
            </select>
        </div>
         <div class="field">
            <label for="breed">Breed</label>
            <input type="text" name="breed" v-model="pet.breed"/>
        </div>
        <div class="field">
            <label for="size">Size</label>
            <input type="text" name="size" v-model="pet.size"/>
        </div>
        <div class="field">
            <label for="gender">Gender</label>
            <input type="text" name="gender" v-model="pet.gender"/>
        </div>
        <div class="field">
            <label for="name">Personality</label>
            <select id="personality" name="personality" v-model="pet.personalityType">
                <option value="shy">Shy, Timid</option>
                <option value="friendly">Friendly, Sweet</option>
                <option value="loving">Loving, Affectionate</option> 
                <option value="curious">Curious, Adventurous</option>
                <option value="gentle">Gentle, Laidback</option>
                <option value="active">Active, Playful</option>
                <option value="confident">Confident, String-Willed</option>
            </select>
        </div>
        <div class="field">
            <label for="bio">Bio</label>
            <input type="text" name="bio" v-model="pet.description"/>
        </div>
        <div class="actions">
            <button type="submit" v-on:click="submitPetForm">Add Pet</button>
        </div>
    </form>
</div>
</template>

<script>
import applicationServices from "@/services/ApplicationServices";

export default {
    name: "add-pet",
    data() {
        return {
            pet: {
                profileId: 1,
                petName: "",
                age: "",
                petType: "",
                breed: "",
                size:"",
                gender: "",
                personalityType: "",
                description: ""
            },
            errorMessage: ""
        };
    },
    methods: {
        submitPetForm() {
            const newPet = this.pet;
            if (this.pet.profileId === 1) {
                applicationServices
                    .addPet(newPet)
                    .then(response => {
                        if(response.status === 200) {
                            this.$router.push(`/profile`, newPet);
                        }
                    })
                    .catch(error => {
                        this.handleErrorResponse(error, "updating");
                    });
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
        }
    },
}
</script>

<style scoped>
#register {
    font-family: Arial, Helvetica, sans-serif;
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