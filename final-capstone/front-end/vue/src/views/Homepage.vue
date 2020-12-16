<template>
    <div>
        <top-home-bar />
        <homepage />
        <footer-bar />
    </div>
</template>

<script>

import homepage from '@/components/Homepage';
import TopHomeBar from '../components/TopHomeBar.vue';
import FooterBar from '../components/FooterBar.vue';

export default {
    components: {
        homepage,
        TopHomeBar,
        FooterBar
    }
}
</script>
