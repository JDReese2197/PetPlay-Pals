<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
        </div>

        <div class="nav"> <!-- This is the list of nav buttons on the user profile page-->
            <h1 class="title">Schedule Page</h1>
            <router-link v-bind:to="{name: 'profile-page'}"><button class="nav-btn"><strong>Your Profile</strong></button></router-link>
            <router-link v-bind:to="{name: 'find-a-playdate'}"><button class="nav-btn"><strong>Find a Playdate</strong></button></router-link>
            <router-link v-bind:to="{name: 'add-pet'}"><button class="nav-btn"><strong>Register a Pet</strong></button></router-link>
            <router-link v-bind:to="{name: 'logout'}"><button class="nav-btn"><strong>Log Out</strong></button></router-link>
        </div>

    </div>
</template>

<script>
import PlayDateCard from './CalendarCard.vue'
import applicationServices from '@/services/ApplicationServices';
export default {
    name: "play-date-list", 
    components: { PlayDateCard },
    data() {
        return {
            playDateCards: []
        }
},
    methods: {
        retrieveUserProfile() {
            applicationServices
                .getProfileById(this.$store.state.user.id)
                .then(response => {
                    if(response.status === 200) {
                        this.$store.commit("SET_PROFILE", response.data);
                        this.retrievePetProfile();
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
                         this.getAllOpenPlayDates();
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                })
        },
        getAllOpenPlayDates() {
            applicationServices
            .displayAcceptedInvite(this.$store.state.pet.petId)
            .then(response => {
                if(response.status === 200) {
                    this.playDateCards = response.data;
                }
            })
            .catch ( error => {
                console.log(error);
            })
        },
    },
    mounted() {
        this.getAllOpenPlayDates()
    },
    created() {
        this.retrieveUserProfile(); 
    },
    computed: {
        profile() {
            return this.$store.state.profile;
        },
        pet() {
            return this.$store.state.pet;
        }
    }
}

</script>

<style scoped>
.container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
    display: grid;
    grid-template-columns: 15% 85%;
    grid-template-areas:
    "nav petSearch"
    ;
}

.play-date-cards {
    grid-area: petSearch;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: flex-start;
    padding: 5px;
    margin: 15px;
}
.nav {
    grid-area: nav;
    padding-top: 25px;
    padding-bottom: 100px;
    display: flex;
    flex-direction: column;
    justify-content: stretch;
    background-color: #96f8fc;
}
.nav-btn {
    border: none;
    border-radius: 25px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin: 10px;
    margin-top: 25px;
    background-image: linear-gradient(#fd6d68, #dd4b46);
    color: white;
    font-size: 15px;
    width: 90%;
    height: 50px;
    text-align: center;
}
.title {
    text-align: center;
}
</style>