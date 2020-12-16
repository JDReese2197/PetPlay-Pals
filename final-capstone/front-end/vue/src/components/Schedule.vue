<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <h1>My Schedule</h1>
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
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
            playDateCards: [],
            pet: {},
            profile: {}
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
        
    }
}

</script>

<style scoped>
.container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
    
}
h1 {
    color: #ff5757;
    text-align: center;
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