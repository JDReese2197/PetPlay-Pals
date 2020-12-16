<template>
    <div>
        <top-home-bar/>
        <h1>Register Your Pet</h1>
        <add-pet />
        <footer-bar/>
    </div>
</template>

<script>

import addPet from "@/components/AddPet";
import topHomeBar from "@/components/TopHomeBar";
import footerBar from '@/components/FooterBar.vue';

export default {
    components: {
        addPet,
        topHomeBar,
        footerBar
    }
}
</script>

<style scoped>
h1 {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    color: #29d2db;
}
</style>