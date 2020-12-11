<template>
    <div>
        <top-home-bar/>
        <play-date-card/>
        <!-- We need a filter bar -->
        <!-- We need to display all cards based on the filter -- should show ALL until user filters -->
        <!-- -->
        <!-- -->

    </div>
</template>

<script>
import PlayDateCard from '../components/PlayDateCard.vue'
import TopHomeBar from '../components/TopHomeBar.vue'
export default {
  components: { PlayDateCard, TopHomeBar },
    
}
</script>

<style scoped>

</style>
