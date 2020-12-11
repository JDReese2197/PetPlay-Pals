<template>
    <div>
        <h1>Create Profile</h1>
        <user-profile-form />
    </div>
</template>

<script>

import userProfileForm from '@/components/UserProfileForm';

export default {
    components: {
        userProfileForm
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