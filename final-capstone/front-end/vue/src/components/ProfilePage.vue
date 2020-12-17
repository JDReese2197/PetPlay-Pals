<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
            <div class="pet-image">
                <img v-for="pet in pets" v-bind:key="pet.petId"
                id = "pet-pic" v-bind:src = "pet.profilePhoto" v-on:click="changePet(pet)"/>
                <router-link v-bind:to="{name: 'add-pet'}"><div id = "pet-pic"></div></router-link>
            </div> 
            <br/>
            <br/>
            <br/>  
        </div>
        <!-- Pet image/TEMPORARY IMG-->
        <div class="pet-info">   
            <h1>{{pet.petName}}'s Profile</h1>
            <p> {{pet.petType}} | {{pet.breed}} | {{pet.size}} </p>
            <p> {{pet.age}} | {{pet.gender}} </p>
            <p> {{pet.personalityType}} </p>
            <p> {{pet.description}} </p>
            <router-link class="link" v-bind:to="{name: 'registerpet'}"><button id="edit-pet-profile">Edit Profile</button></router-link>
        </div> 

        <div class="user-info"> <!-- This is the user info section -->
            <h1>{{pet.petName}}'s Human</h1>
            <p>{{profile.firstName}} {{profile.lastName}}</p>
            <p>{{profile.address1}}, {{profile.address2}}</p>
            <p>{{profile.city}}, {{profile.state}} {{profile.zip}}</p>
            <p>{{profile.email}}</p>
            <p>{{profile.phone}}</p>
            <router-link class="link" v-bind:to="{name: 'user-profile-form'}"><button id="edit-user-profile">Edit Profile</button></router-link>
        </div>
        
        <!-- <div class="user-profile-nav"> This is the list of nav buttons on the user profile page -->
            <!-- <router-link v-bind:to="{name: 'schedule'}"><button class="nav-btn" id="schedule-btn">Your Schedule</button></router-link>
            <router-link v-bind:to="{name: 'find-a-playdate'}"><button class="nav-btn">Find a Playdate</button></router-link>
            <router-link v-bind:to="{name: 'add-pet'}"><button class="nav-btn">Register a Pet</button></router-link>
            <router-link v-bind:to="{name: 'logout'}"><button class="nav-btn">Log Out</button></router-link> -->
        <!-- </div> -->
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';

export default {
    components: { 
    },
    props: ['user'],
    data() {
        return {
            
        }
    },
    methods: {
        changePet(pet) {
            this.$store.commit('SET_PET', pet);
        },
        retrieveUserProfile() {
            applicationServices
                .getProfileById(this.$store.state.user.id)
                .then(response => {
                    if(response.status === 200) {
                        this.$store.commit("SET_PROFILE", response.data);
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                })
        },
        retrievePetProfile() {
            applicationServices
                .getPetsByUserId(this.$store.state.user.id)
                .then(response => {
                    if(response.status === 200) {
                         this.$store.commit("SET_PETS", response.data)
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                })
        }
    },
    mounted() {
        this.retrieveUserProfile(); 
        this.retrievePetProfile();
    },
    computed: {
        profile() {
            return this.$store.state.profile;
        },
        pet() {
            return this.$store.state.pet;
        },
        pets() {
            return this.$store.state.pets;
        }
    }
    
}
</script>

<style scoped>
.user-profile {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas:
    "petbar petinfo userinfo"
    "petbar .       ."
    "footer footer  footer"
    ;
}
p {
    font-size: 20px;
    color: #555555;
}
.user-info {
    grid-area: userinfo;
    margin-top: 20px;
}
.pet-info {
    grid-area: petinfo;
    margin-top: 20px;
    margin-left: 12%;
}

.pet-profile-side-bar {
    grid-area: petbar;
    padding-top: 25px;
}

.pet-image {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

#pet-pic {
    background-color: #ffe473;
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 300px;
    height: 300px;
    margin: 15px;
    align-content: center;
    position: relative;
    box-shadow: 0 4px 8px 0 #ffe473, 0 6px 20px 0 #ffe473;
}

#pet-pic::after {
  content: " ";
  position: absolute;
  display: block;
  background-color: #fff;
  height: 25px;
  margin-top: -11px;
  top: 50%;
  left: 75px;
  right: 75px;
  z-index: 9;
  border-radius: 20px;
}
#pet-pic::before {
  content: " ";
  position: absolute;
  display: block;
  background-color: #fff;
  width: 25px;
  margin-left: -11px;
  left: 50%;
  top: 75px;
  bottom: 75px;
  z-index: 9;
  border-radius: 20px;
}

button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    color: white;
    width: 150px;
    height: 25px;
    text-align: center;
}
#edit-pet-profile {
    background-color: #ff5757;
}
#edit-user-profile {
    background-color: #5ce1e6;
}
#edit-pet-profile:hover {
    background-color: #ffe473;
}
#edit-user-profile:hover {
    background-color: #ffe473;  
}

.pet-info h1 {
    color: #e6615c; 
}
.user-info h1 {
    color: #5ce1e6;
}

/* .find-a-friend {
    background-color: #5CE1E6;
} */

/* span {
    display: flex;
    flex-direction: row;
    justify-content: center;
    color:  #5CE1E6;

} */

/* .user-profile-nav {
    grid-area: nav;
    display: flex;
    flex-direction: column;
} */
</style>