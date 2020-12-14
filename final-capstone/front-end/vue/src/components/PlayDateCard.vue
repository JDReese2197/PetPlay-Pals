<template>
<!-- A single playdate card-->
<div class="container">
<div data-aos="fade-up" class="playdate-card"> 
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h2>{{pet.petName}}</h2>
        <h4> {{pet.breed}} | {{pet.gender}} | Age {{pet.age}}</h4>
        <h4> At {{playDate.location}} on {{playDate.theDate}} from {{playDate.startTime}} - {{playDate.endTime}} </h4>
        <h5> Description: {{playDate.details}}</h5>
        <button v-on:click="acceptPlaydate">Book PlayDate</button>
    </div>
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
  computed: {  },
  methods: {
       getPet() {
           applicationServices
           .getPetByPetId(this.playDate.petPosterId)
           .then(response => {
               if(response.status === 200) {
                   this.pet = response.data;
               }
           })
           .catch (error => {
               console.log(error);
           })
       },
       acceptPlaydate() {
            console.log("Functionality not yet implemented.  Please get devs more coffee if you would like to have access.")
            //   TODO Create method in application services to join an open playdate.
            //   TODO edit methods in JDBCPlayDateDAO and apictontroller

            const playDateId = this.playDate.playdateId
            console.log(`playDateId: ${playDateId}`)
            const userId = this.$store.state.user.id;
            console.log(`userId: ${userId}`)
       }
  },
  mounted() {
      this.getPet();
  }
}
</script>

<style scoped>
.container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
}

h2, h4, h5 {
    white-space:pre-wrap;
    margin: 10px;
}
.playdate-card {
    width: 250px;
    height: auto !important;
    border-radius: 25px;
    background-image: linear-gradient(rgb(243, 243, 138), #5be1e6);
    padding: 5px;
    margin: 15px;
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