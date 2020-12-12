<template>
    <!-- This is where we will display a list of playdate cards-->
    <div class="container">
        <div class="aPlayDateCard" v-for="card in playDateCards"
        v-bind:key="card.id">
        <play-date-card/>
        </div>
        <!-- TO DO: make a view card details method and add this above:  v-on:click="viewCardDetails(card.id)"-->
    </div>
</template>

<script>
import PlayDateCard from './PlayDateCard.vue'
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
        }
        // randomBackgroundColor() {
        //     return "#" + this.generateHexCode();
        // },
        // generateHexCode() {
        //     var bg = Math.floor(Math.random()*16777215).toString(16);
        //     if (bg.length !== 6) bg = this.generateHexCode();
        //     return bg;
        // }
    },
    mounted() {
        this.getAllOpenPlayDates()
    }
}

</script>

<style scoped>
.container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
</style>