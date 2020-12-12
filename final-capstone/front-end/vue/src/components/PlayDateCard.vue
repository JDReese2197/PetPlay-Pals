<template>
<!-- A single playdate card-->
<div data-aos="fade-up" class="playdate-card"> 
        <img id="pet-img" src="https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"/>
        <h3>{{playDate.playdateId}}</h3>
        <p> {{}} </p>
        <p> etc </p>
        <p> etc </p>
    </div>
</template>

<script>
import applicationServices from '../services/ApplicationServices';
export default {
  components: { },
    name: "play-date-card",
    props: ['playDate'],
  data() { 
      return {
          pet: {},
      }
  },
  computed: {
        getPet() {
            return this.$store.state.pet;
        },
  },
  methods: {
        getPlayDate() {
            console.log(this.$store.playDates.playdate.playdateId)
            applicationServices.getPlayDateByPlayDateId(this.$store.playDates.playdate.playdateId)
            .then(response => {
                console.log(response)
                if(response.status === 200) {
                    this.playdate = response.data;
                }
            }) .catch (error => {
                console.log(error);
            })
        }
    //    getPet() {
    //        applicationServices
    //        .getPetByPetId()
    //        .then(response => {
    //            if(response.status === 200) {
    //                console.log('helpme');
    //                this.pet = response.data;
    //            }
    //        })
    //        .catch (error => {
    //            console.log(error);
    //        })
    //    }     
  },
  mounted() {
      this.getPlayDate();
  }
}
</script>

<style scoped>
.playdate-card {
    width: 200px;
    height: auto !important;
    border-radius: 25px;
    background-image: linear-gradient(#39cfd4, #7bf4f8);
    padding: 5px;
    text-align: center;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

#pet-img {
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 100px;
    height: 100px;
    margin: 5px;
    align-content: center;
    
}
</style>