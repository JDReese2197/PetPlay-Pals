<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <play-date-map v-if="true" v-bind:playDates="playDateCards"/>
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
        </div>

        <div class="nav"> <!-- This is the list of nav buttons on the user profile page-->
            <h1 class="title">Available Playdates</h1>
            <!-- <router-link v-bind:to="{name: 'profile-page'}"><button class="nav-btn"><strong>Your Profile</strong></button></router-link>
            <router-link v-bind:to="{name: 'schedule'}"><button class="nav-btn"><strong>Your Schedule</strong></button></router-link>
            <router-link v-bind:to="{name: 'add-pet'}"><button class="nav-btn"><strong>Register a Pet</strong></button></router-link>
            <router-link v-bind:to="{name: 'logout'}"><button class="nav-btn"><strong>Log Out</strong></button></router-link> -->

            <label for="pet-type-select">Pet Type</label>
            <select id="pet-type-select" v-model="petFilter.petType">
                <option value="Dog">Dog</option>
                <option value="Cat">Cat</option>
                <option value="Bird">Bird</option>
                <option value="Reptile">Reptile</option>
                <option value="Other">Other</option>
            </select>

            <label for="personality">Personality</label>
            <select id="personality" name="personality" placeholder="Personality" v-on:change="changeFilter" v-model="petFilter.personalityType">
                <option value="" disabled selected hidden>Personality</option>
                <option value="Shy, Timid">Shy, Timid</option>
                <option value="Friendly, Sweet">Friendly, Sweet</option>
                <option value="loving">loving</option> 
                <option value="Curious, Adventurous">Curious, Adventurous</option>
                <option value="Gentle, Laidback">Gentle, Laidback</option>
                <option value="Active, Playful">Active, Playful</option>
                <option value="Confident, String-Willed">Confident, String-Willed</option>
            </select>

            <label for="distance-selector">Distance to search: </label>
            <select id="distance-selector" v-on:change="changeFilter" v-model="distanceFilter">
                <option value="5" >5 Miles</option>
                <option value="10" >10 Miles</option>
                <option value="15" >15 Miles</option>
                <option value="20" >20 Miles</option>
                <option value="25" >25 Miles</option>
                <option value="0">Unlimited</option>
            </select>
        </div>
    </div>
</template>

<script>
import PlayDateCard from './PlayDateCard.vue';
import PlayDateMap from '@/components/PlayDateMap.vue';
import applicationServices from '@/services/ApplicationServices';

export default {
    name: "play-date-list", 
    components: { PlayDateCard, PlayDateMap },
    data() {
        return {
            playDateCards: [],
            petFilter: {
                petType: this.$store.state.petFilter.petType,
                personalityType: this.$store.state.petFilter.personalityType
            },
            distanceFilter: 0,
        }
},
    methods: {
        getAllOpenPlayDates() {
            applicationServices
            .getPostingsWithoutBooking()
            .then(response => {
                if(response.status === 200) {
                    this.playDateCards = response.data;
                }
            })
            .catch ( error => {
                console.log(error);
            })
        },

        changeFilter() {
            this.$store.commit('SET_PET_FILTER', this.petFilter)
        }

    },
    mounted() {
        this.getAllOpenPlayDates()
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