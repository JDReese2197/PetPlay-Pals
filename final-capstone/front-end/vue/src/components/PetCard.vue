<template>
    <div class= "container">
    <!-- Here is a component holding all the pet data for one pet -->
        <img src = "{{petImage}}" id="pet-img">
        <h5> {{petName}} </h5>
        <p> {{petType}} | {{Breed}} | {{petSize}} </p>
        <p> {{petAge}} | {{petGender}} </p>
        <p> {{petPersonality}} </p>
        <p> {{petDescription}} </p>
    </div>
</template>

<script>
import applicationServices from '../services/ApplicationServices.js'
export default {
     name: "play-date-card",
    data() {
        return {
            playdate: {
                petImage: '',
                petName: '',
                petGender: '',
                petType: '',
                petBreed: '',
                petSize: '',
                petAge: '',
                petPersonality: '',
                petDescription: '',
            }    
        }
    },
    created() {
        // To get the Pet object thru the pet ID
        applicationServices.getPetByPetId(this.$route.params.id).then(response => {
            this.petImage = response.data.petImage;
            this.petName = response.data.petName;
            this.petGender = response.data.petGender;
            this.petType = response.data.petType;
            this.petBreed = response.data.petBreed;
            this.petSize = response.data.petSize;
            this.petAge = response.data.petAge;
            this.petPersonality = response.data.petPersonality;
            this.petDescription = response.data.petDescription;
        })
        
    }
}
</script>

<style scoped>

</style>