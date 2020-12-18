<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <div class = "play-date-cards">
        <play-date-card v-for="playDate in playDateCards"
        v-bind:key="playDate.id" v-bind:playDate = "playDate"/>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
        </div>
        <div class="nav">
            <h3>Select Pet Schedule</h3>
            <select v-model="pet" v-on:change="setPet">
                <option :value="pet" v-for="pet in getAllPets" v-bind:key="pet.petId">{{pet.petName}}</option>
            </select>
            <br/>
            <play-date-map v-if="true" v-bind:playDates="playDateCards"/>
        </div>
    </div>
</template>

<script>
import PlayDateCard from './ScheduleCard.vue'
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
            pet: this.$store.state.pet,
            profile: this.$store.state.profile
        }
},
    methods: {
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
        setPet() {
            this.$store.commit('SET_PET', this.pet);
            window.location.reload();
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
        "nav petSearch";   
}
h3 {
    color: #ff5757;
    text-transform: uppercase;
}
.play-date-cards {
    grid-area: petSearch;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: flex-start;
    padding: 5px;
    margin: 15px;
}
.nav {
    grid-area: nav;
    padding-left: 15px;
    padding-top: 25px;
    padding-bottom: 100px;
    display: flex;
    flex-direction: column;
    justify-content: stretch;
}
select {
    width: 100%;
    padding: 5px 5px;
    margin: 5px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
}
</style>