<template>
    <div>
        <top-home-bar/>
        <h1>Create Profile</h1>
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
    }
}
</script>

<style scoped>
h1 {
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;
    color: #29d2db;
}
</style>