<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
        </div>

        <div class="nav"> <!-- This is the list of nav buttons on the user profile page-->
            <h3>Select Current Pet</h3>
            <select>
                <option :value="pet" v-for="pet in getAllPets" v-bind:key="pet.petId">{{pet.petName}}</option>
            </select>
            <br/>
            <router-link class="link" v-bind:to="{name: 'post-playdate'}"><button id="post-playdate">Post a Playdate</button></router-link>

            <h3 class="title">Filter</h3>

            <div class="field">
                <label for="pet-type-select">Pet Type</label>
                <div>
                    <select id="pet-type-select" v-on:change="changeFilter" v-model="petFilter.petType">
                        <option value="">Any</option>
                        <option value="Dog">Dog</option>
                        <option value="Cat">Cat</option>
                        <option value="Bird">Bird</option>
                        <option value="Reptile">Reptile</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div class="field">
                <label for="personality">Personality</label>
                <select id="personality" name="personality" v-on:change="changeFilter" v-model="petFilter.personalityType">
                    <option value="">Any</option>
                    <option value="Shy, Timid">Shy, Timid</option>
                    <option value="Friendly, Sweet">Friendly, Sweet</option>
                    <option value="loving">Loving, Affectionate</option> 
                    <option value="Curious, Adventurous">Curious, Adventurous</option>
                    <option value="Calm, Laidback">Calm, Laidback</option>
                    <option value="Energetic, Playful">Energetic, Playful</option>
                    <option value="Confident, Strong-Willed">Confident, Strong-Willed</option>
                </select>
            </div>

            <div class="field">
                <label>Enter your location: </label>
                <gmap-autocomplete id="location-inator" v-on:place_changed="setPlace"></gmap-autocomplete>

                <label for="distance-selector">Distance to search: </label>
                <select id="distance-selector" v-model="distanceFilter" v-on:change="changeDistanceFilter">
                    <option value="0">Unlimited</option>
                    <option value="5" >5 Miles</option>
                    <option value="10" >10 Miles</option>
                    <option value="15" >15 Miles</option>
                    <option value="20" >20 Miles</option>
                    <option value="25" >25 Miles</option>
                </select>
            </div>
            <play-date-map v-if="true" v-bind:playDates="playDateCards"/>
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
            petIndex: 0,
            playDateCards: [],
            petFilter: {
                petType: this.$store.state.petFilter.petType || "",
                personalityType: this.$store.state.petFilter.personalityType || ""
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

        //  Methods to change filters saved in store for easier searching of playdates
        changeFilter() {
            this.$store.commit('SET_PET_FILTER', this.petFilter);
        },
        changeDistanceFilter() {
            this.$store.commit('SET_DISTANCE_FILTER', this.distanceFilter);
        },

        //  Method to set and save a location to be searched around
        setPlace(place) {
            console.log(`${place.geometry.location.lat()}, ${place.geometry.location.lng()}`)
            this.location = place;
            this.$store.commit('SET_LOCATION', this.location);
        },

        //  Change current pet in the store
        setPet(i) {
            this.$store.commit('SET_PET', this.getAllPets[i]);
        }
    },
    mounted() {
        this.getAllOpenPlayDates()
    },
    computed: {
        getAllPets() {
            return this.$store.state.pets;
        }
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
    "nav     petSearch"
    ;
}
h3 {
    color: #ff5757;
    text-transform: uppercase;
}
.link{
    text-decoration: none;
}
button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    text-align: center;
    padding: 5px 15px;
    color: white;
    font-size: 17px;
    font-weight: bold;
}
#post-playdate {
    background-color: #5ce1e6;
}
#post-playdate:hover {
    background-color: #ffe473;
}

input {
    width: 100%;
    padding: 5px 5px;
    margin: 5px 0;
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
    padding: 5px 5px;
    margin: 5px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
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
}
.nav-map {
    grid-area: nav-map;
}
</style>