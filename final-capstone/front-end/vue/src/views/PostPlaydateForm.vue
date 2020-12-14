<template>
    <div>
        <top-home-bar/>
        <h1>Post a Playdate</h1>
        <post-playdate-form/>
    </div>
</template>

<script>

import postPlaydateForm from '@/components/PostPlaydateForm';
import topHomeBar from '@/components/TopHomeBar';

export default {
    components: {
        postPlaydateForm,
        topHomeBar
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