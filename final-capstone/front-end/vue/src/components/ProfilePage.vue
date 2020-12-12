<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
            <div class="pet-image">
                <img id = "pet-pic" src = "https://res.cloudinary.com/ashdav/image/upload/v1607530571/img/Rudy_dt7y3q.png"/>
                <img id = "pet-pic" src = "https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"/> 
            </div>   
        </div>
        <!-- Pet image/TEMPORARY IMG-->
        <div class="pet-info">   
            <h1>{{pet.petName}}'s Profile</h1>
            <p> Type | Breed | Size </p>
            <p> Age | Gender </p>
            <p> Personality </p>
            <p> Bio </p>
            <router-link v-bind:to="{name: 'addPet'}"><button id="edit-profile">Edit Profile</button></router-link>
        </div> 

        <div class="user-info"> <!-- This is the user info section -->
            <h1>Rudy's Human</h1>
            <p>{{profile.firstName}} {{profile.lastName}}</p>
            <p>{{profile.address1}}, {{profile.address2}}</p>
            <p>{{profile.city}}, {{profile.state}} {{profile.zip}}</p>
            <p>{{profile.email}}</p>
            <p>{{profile.phone}}</p>
            <router-link v-bind:to="{name: 'user-profile-form'}"><button id="edit-profile">Edit Profile</button></router-link>
        </div>

        <div class="user-profile-nav"> <!-- This is the list of nav buttons on the user profile page-->
            <button class="nav-btn" id="schedule-btn">Your Schedule</button>
            <router-link v-bind:to="{name: 'find-a-playdate'}"><button class="nav-btn">Find a Playdate</button></router-link>
            <router-link v-bind:to="{name: 'add-pet'}"><button class="nav-btn">Register a Pet</button></router-link>
            <router-link v-bind:to="{name: 'logout'}"><button class="nav-btn">Log Out</button></router-link>
        </div>
        <footer-bar class="footer"/>
        <div><h6><a href="https://media1.tenor.com/images/c65f4fdd955cdc6614899b0a38b8473e/tenor.gif?itemid=5648271">
        © 2020 Pet Play Pals. All Rights Reserved</a></h6>
        </div>
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';
import footerBar from '@/components/FooterBar';

export default {
    components: { 
        footerBar
    },
    props: ["user"], 
    data() {
        return {

        }
    },
    methods: {
        retrieveUserProfile() {
            applicationServices
                .getProfileById(this.$store.state.user.id)
                .then(response => {
                    if(response.status === 200) {
                         this.$store.commit("SET_PROFILE", response.data)
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                })
        },
        retrievePetProfile() {
            applicationServices
                .getAPetByProfileId(this.$store.state.profile.profileId)
                .then(response => {
                    if(response.status === 200) {
                         this.$store.commit("SET_PET", response.data)
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                })
        }
    },
    created() {
        this.retrieveUserProfile();
        this.retrievePetProfile();
    },
    computed: {
        profile() {
            return this.$store.state.profile;
        },
        pets() {
            return this.$store.state.pets;
        }
    }
    
}
</script>

<style scoped>
.user-profile {
    font-family: Arial, Helvetica, sans-serif;
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    grid-template-areas:
    "petbar petinfo nav"
    "petbar userinfo  nav"
    "footer footer   footer"
    ;
    grid-gap: 25px;
}
p {
    font-size: 20px;
    color: #555555;
}
.user-info {
    grid-area: userinfo;
}

.footer {
    grid-area: footer;
    text-align: center;
}

.footer > h6 > a {
    color: #555555;
    text-decoration: none; 
}

.user-profile-nav {
    grid-area: nav;
    display: flex;
    flex-direction: column;
}

.pet-profile-side-bar {
    grid-area: petbar;
    /*background-color: #D7FEFF;*/
}

.h2 {
    color: #5CE1E6;
}

.find-a-friend {
    background-color: #5CE1E6;
}


.pet-image {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

#pet-pic {
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 300px;
    height: 300px;
    margin: 15px;
    align-content: center;
}

.pet-info {
    grid-area: petinfo;
}

#edit-profile, #edit-play-date-preferences {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    background-color: #e6615c;
    color: white;
    width: 150px;
    height: 25px;
    text-align: center;
}
.nav-btn {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    margin: 10px;
    background-color: #e6615c;
    color: white;
    font-size: 20px;
    width: 90%;
    height: 40px;
    text-align: center;
}
#schedule-btn {
    margin-top: 25px;
}
#find-a-friend  {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    background-color: #5CE1E6;
    color: white;
    align-content: center;
}

span {
    display: flex;
    flex-direction: row;
    justify-content: center;
    color:  #5CE1E6;

}

a:link {
    color: rgb(39, 39, 39);
}

h1 {
    color: #e6615c;
}
</style>