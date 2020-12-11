<template>
    <div>
    <!-- Here is a component holding all the pet data -->
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