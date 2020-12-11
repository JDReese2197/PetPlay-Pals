<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
        
            <div class="pet-image">
                <img id = "pet-pic" src = "https://res.cloudinary.com/ashdav/image/upload/v1607530571/img/Rudy_dt7y3q.png"/>
                <img id = "pet-pic" src = "https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"/> 
            </div>
            
            
        </div> 

        <div class="user-info"> <!-- This is the user info section -->
        
            <h1>Human</h1>
            <p>{{profile.firstName}} {{profile.lastName}}</p>
            <p>{{profile.address1}}, {{profile.address2}}</p>
            <p>{{profile.city}}, {{profile.state}} {{profile.zip}}</p>
            <p>{{profile.email}}</p>
            <p>{{profile.phone}}</p>
            <router-link v-bind:to="{name: 'register'}"><button id="edit-profile">Edit Profile</button></router-link>
        </div>

         <!-- Pet image/TEMPORARY IMG-->
        <div class="pet-info"> 
                
            <h1>PetName</h1>
            <p> Type | Breed | Size </p>
            <p> Age | Gender </p>
            <p> Personality </p>
            <p> Bio </p>
            <router-link v-bind:to="{name: 'addPet'}"><button id="edit-profile">Edit Profile</button></router-link>
            <button id="find-a-friend">FIND A FRIEND</button>
                <!-- Will link to the pet playdate search page-->
        </div>

        <div class="user-profile-nav"> <!-- This is the list of nav buttons on the user profile page-->
            <button class="nav-btn">Your Calendar</button>
            <router-link v-bind:to="{name: 'add-pet'}"><button class="nav-btn">Register a Pet</button></router-link>
            <button class="nav-btn">Your Messages</button>
            <router-link v-bind:to="{name: 'logout'}"><button class="nav-btn">Log Out</button></router-link>
        </div>

        <div class="footer"><h6><a href="https://media1.tenor.com/images/c65f4fdd955cdc6614899b0a38b8473e/tenor.gif?itemid=5648271">
        © 2020 Pet Play Pals. All Rights Reserved</a></h6>
        </div>
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';

export default {
    components: { 

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
    },
    created() {
        this.retrieveUserProfile();
    },
    computed: {
        profile() {
            return this.$store.state.profile;
        }
    }
    
}
</script>

<style scoped>
.user-profile {
    font-family: Arial, Helvetica, sans-serif;
    display: grid;
    grid-template-rows: 1fr 2fr 1fr;
    grid-template-areas:
    "petbar userinfo nav"
    "petbar petinfo  nav"
    "footer footer   footer"
    ;
    grid-gap: 25px;
}
.user-info {
    grid-area: userinfo;
    width: 600px;
    
}

.footer {
    grid-area: footer;
    text-align: center;
}

.footer > h6 > a {
    color: black;
    text-decoration: none; 
}

.user-profile-nav {
    grid-area: nav;
    display: flex;
    flex-direction: column;
}

.pet-profile-side-bar {
    grid-area: petbar;
    background-color: #D7FEFF;
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

.nav-btn, #edit-profile, #edit-play-date-preferences {
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