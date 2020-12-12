<template>
    <div class="container">
      <top-home-bar/>
      <div class="play-date-list">
      <schedule/>
      </div>
        <!-- We need a filter bar -->
        <!-- We need to display all cards based on the filter -- should show ALL until user filters -->
        <!-- -->
        <!-- -->
      <footer-bar/>
    </div>
    
</template>

<script>
import FooterBar from '../components/FooterBar.vue'
import Schedule from '../components/Schedule.vue'
import TopHomeBar from '../components/TopHomeBar.vue'
export default {
  components: { TopHomeBar, FooterBar, Schedule },
    
}
</script>

<style scoped>
/* .container {

}
.play-date-list {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
} */
</style>
