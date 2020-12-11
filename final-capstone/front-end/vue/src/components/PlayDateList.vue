<template>
    <!-- This is where we will display a list of playdate cards-->
    <div>
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
                console.log(response)
                if(response.status === 200) {
                    this.playDateCards = response.data;
                }
            })
            .catch ( error => {
                console.log("uh oh")
                console.log(error);
            })
        }
    },
    mounted() {
        this.getAllOpenPlayDates()
    }
}

</script>

<style scoped>

</style>