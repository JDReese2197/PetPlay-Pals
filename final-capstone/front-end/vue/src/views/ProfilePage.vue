<template>
<div>
    <profile-page/>
    <top-home-bar/>
    <update-user-profile/>
</div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue'
import ProfilePage from '../components/ProfilePage.vue'
import UpdateUserProfile from '../components/UpdateUserProfile.vue'

export default {
  components: { TopHomeBar, ProfilePage, UpdateUserProfile},
    
}
</script>