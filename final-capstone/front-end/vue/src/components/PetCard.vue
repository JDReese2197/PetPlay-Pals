<template>
    <div>
    <!-- Here is a component holding all the pet data -->
    </div>
</template>

<script>
import ApplicationServices from '@/services/ApplicationServices.js'
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

    }
}
</script>

<style scoped>

</style>