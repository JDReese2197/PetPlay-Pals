<template>
<!-- A single playdate card-->
<div class="container">
<div data-aos="fade-up" class="playdate-card" v-if="!declined && passesFilter"> 
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h2>{{pet.petName}}</h2>
        <h3>{{pet.breed}} | {{pet.gender}} | Age {{pet.age}}</h3>
        <h4>{{playDate.location}}</h4>
        <h4>{{playDate.theDate}}</h4>
        <h4>{{playDate.startTime}} - {{playDate.endTime}}</h4>
        <p>Description: {{playDate.details}}</p>

        <button v-on:click="acceptPlaydate">Book Playdate</button>
        <button v-on:click="declined = true">Ignore Playdate</button>
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
          declined: false,
        //   passes: this.passesFilter()
      }
    },
  computed: {
      passesFilter() {
            let passes = true;
            const petFilter = this.$store.state.petFilter;

            if(petFilter.petType) {
                passes = this.pet.petType == petFilter.petType ? passes : false
            }
            if(petFilter.personalityType) {
                passes = this.pet.personalityType == petFilter.personalityType ? passes : false
            }

            return passes;
      }
  },
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
            const petId = this.$store.state.pet.petId

            this.playDate.petBookerId = petId;


            console.log(this.playDate)

            applicationServices
                .bookPlaydate(this.playDate)

       }
  },
  mounted() {
      this.getPet();
  },
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