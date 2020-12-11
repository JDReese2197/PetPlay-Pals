<template>
<div>
    <top-home-bar/>
    <profile-page v-bind:profileId="parseInt(this.$route.params.profileId)"/>
</div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue'
import ProfilePage from '../components/ProfilePage.vue'

export default {
  components: { 
    TopHomeBar, 
    ProfilePage
  },
    
}
</script>