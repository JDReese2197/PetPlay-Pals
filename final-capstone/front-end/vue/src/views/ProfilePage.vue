<template>
<div>
    <top-home-bar/>
    <profile-page/>
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