<template>
<!-- A single playdate on calendar card-->
<div class="container">
<div data-aos="fade-up" class="playdate-card"> 

    <div class="pet-poster">
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h2>{{pet.petName}}</h2>
        <h4>{{pet.gender}}</h4>
        <h4>{{pet.breed}}</h4>
    </div>

    <div class="pet-booker">
        <img id = "pet-img" v-bind:src = "secondPet.profilePhoto"/>
        <h2>{{secondPet.petName}}</h2>
        <h4>{{secondPet.gender}}</h4>
        <h4>{{secondPet.breed}}</h4>
    </div>

    <div class="playdate">
        <h4> At {{playDate.location}} on {{playDate.theDate}} from {{playDate.startTime}} - {{playDate.endTime}} </h4>
        <h5> Description: {{playDate.details}}</h5>
    </div>

    <div class="message">
        <input type="text" name="message"/>
    </div>

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
          secondPet: {}
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
  getSecondPet() {
           applicationServices
           .getPetByPetId(this.playDate.petBookerId)
           .then(response => {
               if(response.status === 200) {
                   this.secondPet = response.data;
               }
           })
           .catch (error => {
               console.log(error);
           })
  }
       },     
  mounted() {
      this.getPet();
      this.getSecondPet();
  }
}
</script>

<style scoped>
.container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
}

.pet-poster {
    grid-area: poster;
}

.pet-booker {
    grid-area: booker;
}

.playdate {
    grid-area: footer;
}

.message {
    grid-area: message;
}

input {
    resize: horizontal;
    width: 200px;
    height: 200px;
    text-align: unset start;
}

h2, h4, h5 {
    white-space:pre-wrap;
    margin: 2px;
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

    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr;
    grid-template-areas: 
    "poster booker"
    "footer footer"
    "message message"
    ;
        grid-gap: 0px 30px;
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