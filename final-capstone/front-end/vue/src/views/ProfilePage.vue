<template>
<div>
    <top-home-bar/>
    <profile-page v-bind:profileId="parseInt(this.$store.state.profile.profileId)"/>
    <footer-bar />
</div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue'
import ProfilePage from '../components/ProfilePage.vue'
import FooterBar from '../components/FooterBar.vue'

export default {
  components: { 
    TopHomeBar, 
    ProfilePage,
    FooterBar
  },
    
}
</script>