<template>
    <div>
        <top-home-bar/>
        <h1 v-if="!this.$store.state.pet.petId">Register Your Pet</h1>
        <h1 v-else>Update Pet Profile</h1>
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
    color: #ff5757;
}
</style>