<template>
    <div class="container">
      <top-home-bar/>
      <div class="play-date-list">
      <play-date-list/>
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
import PlayDateList from '../components/PlayDateList.vue'
import TopHomeBar from '../components/TopHomeBar.vue'
export default {
  components: { TopHomeBar, FooterBar, PlayDateList },
    
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
