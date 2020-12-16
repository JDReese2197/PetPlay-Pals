<template>
<div id="update-profile">
    <form v-on:submit.prevent="updateProfile">
        <div class="field">
            <label for="name">First Name</label>
            <input type="text" name="firstName" v-model="user_profile.firstName"/>
        </div>
        <div class="field">
            <label for="name">Last Name</label>
            <input type="text" name="lastName" v-model="user_profile.lastName"/>
        </div>
        <div class="field">
            <label for="name">Address 1</label>
            <input type="text" name="address1" v-model="user_profile.address1"/>
        </div>
        <div class="field">
            <label for="name">Address 2 *</label>
            <input type="text" name="address2" v-model="user_profile.address2"/>
        </div>
        <div class="field">
            <label for="name">City</label>
            <input type="text" name="city" v-model="user_profile.city"/>
        </div>
        <div class="field">
            <label for="state">State</label>
            <select id="state" name="state" v-model="user_profile.state" >
                <option v-for="state in this.$store.state.states" v-bind:key="state">{{state}}</option>
            </select>
        </div>
        <div class="field">
            <label for="name">Zip Code</label>
            <input type="text" name="zip" v-model="user_profile.zip"/>
        </div>
        <div class="field">
            <label for="name">Email</label>
            <input type="text" name="email" v-model="user_profile.email"/>
        </div>
        <div class="field">
            <label for="name">Phone Number</label>
            <input type="text" name="phone" v-model="user_profile.phone"/>
        </div>
        <div class="actions">
            <button type="submit">Update</button>
        </div>
    </form>
</div>
</template>

<script>
import applicationServices from "@/services/ApplicationServices";

export default {
    created() {
        this.setUserId()
        this.setProfileId()
    },
    name: "update-profile",
    data() {
        return {
            user_profile: {
                userId: null,
                profileId: null,
                firstName: "",
                lastName: "",
                address1: "",
                address2: "",
                city: "",
                state: "",
                zip: "",
                email: "",
                phone: ""
            }
        }
    },
    methods: {
        setUserId() {
            this.user_profile.userId = this.$store.state.user.id
        },
        setProfileId() {
            this.user_profile.profileId = this.$store.state.profile.profileId;
        },
        updateProfile() {
            applicationServices
                .updateUserProfile(this.user_profile)
                .then(response => {
                    if(response.status === 200) {
                        this.$router.push('/profile')
                    }
                })
                .catch(error => {
                    this.handleErrorResponse(error, "Updating")
                })
        },
        handleErrorResponse(error, verb) {
            if (error.response) {  
            this.errorMsg =                                     
                "Error " + verb + " User Profile. Response received was '" + 
                error.response.statusText +                   
                "'.";                                            
            } else if (error.request) {     
                this.errorMsg =                                         
                "Error " + verb + " User Profile. Server could not be reached.";  
            } else {                       
                this.errorMsg =                                            
                "Error " + verb + " User Profile. Request could not be created."; 
            }
        }
    }
}
</script>

<style scoped>
/* #register {
    font-family: Arial, Helvetica, sans-serif;
}
form {
    line-height: 20px;
}
input {
    width:300%;
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
} */
</style>