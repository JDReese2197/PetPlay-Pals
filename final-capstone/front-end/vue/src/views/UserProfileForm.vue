<template>
    <div>
        <top-home-bar/>
        <h1 v-if="!this.$store.state.profile">Create Profile</h1>
        <h1 v-else>Update Profile</h1>
        <user-profile-form />
        <footer-bar/>
    </div>
</template>

<script>

import userProfileForm from '@/components/UserProfileForm';
import TopHomeBar from '../components/TopHomeBar.vue';
import FooterBar from '../components/FooterBar.vue';

export default {
    components: {
        userProfileForm,
        TopHomeBar,
        FooterBar
    },
    computed: {
        adding() {
            return this.$store.state.profile
        }
    }
}
</script>

<style scoped>
h1 {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    color: #ff5757;
}
</style>