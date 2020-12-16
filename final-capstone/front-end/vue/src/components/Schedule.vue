<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <h1>My Schedule</h1>
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
        </div>
        <div class="map">
            <play-date-map v-if="true" v-bind:playDates="playDateCards"/>
        </div>
    </div>
</template>

<script>
import PlayDateCard from './CalendarCard.vue'
import PlayDateMap from '@/components/PlayDateMap.vue';
import applicationServices from '@/services/ApplicationServices';

export default {
    name: "play-date-list", 
    components: { 
        PlayDateCard,
        PlayDateMap
    },
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
    display: grid;
    grid-template-columns: 25% 75%;
    grid-template-areas: 
        ". header"
        "map petSearch";   
}
.map {
    grid-area: map;
    margin-top: 15px;
}
h1 {
    grid-area: header;
    color: #ff5757;
    margin-left: 42px;
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
</style>