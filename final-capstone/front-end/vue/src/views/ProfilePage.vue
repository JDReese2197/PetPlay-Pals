<template>
<div>
    <profile-page/>
    <top-home-bar/>
</div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue'
import ProfilePage from '../components/ProfilePage.vue'
export default {
  components: { TopHomeBar, ProfilePage },
    
}
</script>