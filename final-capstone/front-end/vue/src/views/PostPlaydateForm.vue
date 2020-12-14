<template>
    <div>
        <top-home-bar/>
        <h1>Post a Playdate</h1>
        <post-playdate-form/>
        <footer-bar/>
    </div>
</template>

<script>

import PostPlaydateForm from '@/components/PostPlaydateForm';
import TopHomeBar from '@/components/TopHomeBar';
import FooterBar from '../components/FooterBar.vue';

export default {
    components: {
        PostPlaydateForm,
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