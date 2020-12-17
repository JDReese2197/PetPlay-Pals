<template>
<!-- A single playdate on calendar card-->
<div>
<div class="container">

    <div class="pet-poster">
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h4>{{pet.gender}} | {{pet.breed}}</h4>
    </div>

    <div class="pet-booker">
        <img id = "pet-img" v-bind:src = "secondPet.profilePhoto"/>
        <h4>{{secondPet.gender}} | {{secondPet.breed}}</h4>
    </div>

    <div class="playdate-info">
        <h2>{{pet.petName}} + {{secondPet.petName}}</h2>
        <p>{{playDate.location}}</p>
        <p>{{playDate.theDate}}</p>
        <p>{{playDate.startTime}} - {{playDate.endTime}}</p>
        <p>{{playDate.details}}</p>
    </div>

    <div class="message">
        <textarea style="resize: none" v-model="playDate.userMessage" cols="45" rows="5" :placeholder="playDate.userMessage"></textarea>
        <br/>
        <img class="button" src="https://res.cloudinary.com/ashdav/image/upload/v1608235617/img/15_vclcaz.png" alt="Send a Message" title="Send a Message" v-on:click="displayMessage"/>
        <img class="button" src="https://res.cloudinary.com/ashdav/image/upload/v1608235617/img/13_e4js9m.png" alt="Cancel Playdate" title="Cancel Playdate" v-on:click="declinePlaydate"/>
        <img class="button" id="delete-button" src="https://res.cloudinary.com/ashdav/image/upload/v1608237729/img/trash_pb7gg2.png" alt="Delete Playdate" title="Delete Playdate" type="submit" v-if="canDelete" v-on:click="deletePlaydate"/>
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
  computed: { 
      canDelete() {
          if(this.playDate.petPosterId === this.$store.state.pet.petId) {
              return true;
          }
          else {
              return false;
          }
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
  },
  displayMessage() {
      applicationServices
      .updateChat(this.playDate)
      .then(response => {
          if(response.status === 200) {
              this.playDate.userMessage = response.data;
              window.location.reload();
          }
      })
        .catch (error => {
               console.log(error);
           })
  },
  declinePlaydate() {
      applicationServices
      .declinePlaydate(this.playDate)
      .then(response => {
          if(response.status === 200) {
              window.location.reload();
          }
      })
        .catch (error => {
               console.log(error);
           })
  },
  deletePlaydate() {
      if(this.playDate.petPosterId === this.$store.state.pet.petId) {
          applicationServices
      .deletePlaydate(this.playDate.playdateId)
      .then(response => {
          if(response.status === 200) {
              window.location.reload();
          }
      })
      .catch (error => {
               console.log(error);
           })
      }
      else {
          console.log("you do not have access to delete this");
      }
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
    border-radius: 25px;
    box-shadow: 0 4px 8px #5ce1e6, 0 6px 20px #5ce1e6;
    margin: 15px;
    padding: 20px;
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    grid-template-areas: 
        "poster info booker"
        "poster message booker";
}
.pet-poster {
    grid-area: poster;
    text-align: center;
}
.pet-booker {
    grid-area: booker;
    text-align: center;
}
.playdate-info {
    grid-area: info;
    text-align: center;
}
.message {
    grid-area: message;
    text-align: center;
    margin-top: 10px;
}
#pet-img {
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 200px;
    height: 200px;
    align-content: center;
    box-shadow: 0 4px 8px 0 #ffe473, 0 6px 20px 0 #ffe473;
}
p {
    line-height: 0.5;
}
h4 {
    line-height: 0;
}
h2{
    color: #ff5757;
}
.button {
    width: 50px;
    height: 50px;
    margin: 5px;
}
.button:hover {
    transform: scale(1.1);
}
</style>