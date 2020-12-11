<template>
    <div class="playdate-card"> <!-- A single playdate card-->
        <!-- Need to display: pet_poster, date, start-end time, location, details, pet img-->
        <!-- <img id ="pet-pic" src ="https://res.cloudinary.com/ashdav/image/upload/v1607530571/img/Rudy_dt7y3q.png"/>
        <h1> PET NAME </h1>
        <h4> date </h4>
        <h4> time </h4>
        <h4> location </h4>
        <p>Details</p> -->
        <!-- easy option to accept or decline playdate-->
        <!-- maybe spot to send messages????-->
    </div>
</template>

<script>
import PetCard from './PetCard.vue'
export default {
  components: { PetCard },
    name: "play-date-card",
    data() {
        return {
            
        }
    }
}
</script>

<style scoped>

</style>