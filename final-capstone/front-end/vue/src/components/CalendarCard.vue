<template>
<!-- A single playdate on calendar card-->
<div class="container">
<div data-aos="fade-up" class="calendar-card"> 

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

    <div class="playdateFooter">
        <h4><u>Location:</u> {{playDate.location}}</h4>
        <h4><u>Date:</u> {{playDate.theDate}}</h4>
        <h4><u>Time:</u> {{playDate.startTime}} - {{playDate.endTime}}</h4>
        <h4><u>Description:</u> {{playDate.details}}</h4>
    </div>

    <div class="message">
        <textarea v-model="playDate.userMessage" cols="30" rows="15" :placeholder="playDate.userMessage"></textarea>
        <button type="submit" v-on:click="displayMessage">Send A Message</button>
        <button type="submit" v-on:click="declinePlaydate">Decline Playdate</button>
        <div id="delete-button">
            <button type="submit" v-if="canDelete" v-on:click="deletePlaydate">Delete Playdate</button>
        </div>
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
}

.pet-poster {
    grid-area: poster;
        margin-bottom: 15px;
}

.pet-booker {
    grid-area: booker;
        margin-bottom: 15px;
}

.playdateFooter {
    grid-area: footer;
    margin-bottom: 20px;
    text-align: left;
}

h5 {
    padding-top: 20px;
}

.message {
    grid-area: message;
       resize: none;
}

textarea {
   resize: none;
}

h2, h4, h5 {
    white-space:pre-wrap;
    margin: 2px;
}

.calendar-card {
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
    grid-template-rows: 1fr 1fr auto;
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

button {
    border: none;
    border-radius: 25px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-top: 10px;
    background-image: linear-gradient(#fd6d68, #dd4b46);
    color: white;
    font-size: 15px;
    width: 90%;
    height: 30px;
    text-align: center;
}
</style>