<template>
<div>
    <top-home-bar/>
    <schedule v-bind:profileId="parseInt(this.$route.params.petId)"/>
</div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue'
import Schedule from '../components/Schedule.vue'

export default {
  components: { 
    TopHomeBar, 
    Schedule
  },
    
}
</script>