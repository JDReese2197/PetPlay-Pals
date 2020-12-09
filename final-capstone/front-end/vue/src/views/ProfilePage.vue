<template>
<div>
    <top-home-bar/>
    <profile-page/>
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