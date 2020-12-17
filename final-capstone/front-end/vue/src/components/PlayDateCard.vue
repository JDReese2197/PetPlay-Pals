<template>
<!-- A single playdate card-->
<div class="container">
<div data-aos="fade-up" class="playdate-card" v-if="!declined && passesFilter && passesDistance && !isBooked"> 
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h2 class="pet-info">{{pet.petName}}</h2>
        <h3 class="pet-info">{{pet.breed}} | {{pet.gender}} | Age {{pet.age}}</h3>
        <p class="pet-info" id="pet-description"><strong>About {{pet.petName}}: {{pet.description}}</strong></p>
        <br/>
        <h4>{{playDate.location}}</h4>
        <h4>{{playDate.theDate}}</h4>
        <h4>{{playDate.startTime}} - {{playDate.endTime}}</h4>
        <p>Details: {{playDate.details}}</p>

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
      }
    },
  computed: {
        getStorePet() {
            return this.$store.state.pet;
        },
        //  Returns true if the playdate matches the pet type and personality of filter
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
        },

        //  Returns true if the playdate is within this distance being filtered by
        passesDistance() {
            let playdate = this.playDate
            let searchDistance = this.getDistance;

            if(this.getLocation.geometry && playdate.lat && playdate.lng) {
                const distance = this.calculateDistance(playdate, this.getLocation.geometry.location);

                if(searchDistance == 0 || searchDistance > distance) {
                    return true;
                }
            }
            else if(!this.getLocation.geometry) {
                return true
            }

            return false;
        },

        //  Returns true if the playdate has been booked
        isBooked() {
            return this.playDate.petBookerId;
        },

        getLocation() {
            console.log(this.$store.state.location)
            return this.$store.state.location
        },
        getDistance() {
            return this.$store.state.distanceFilter;
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
            let petId = this.getStorePet.petId

            this.playDate.petBookerId = petId;


            console.log(this.playDate)

            applicationServices
                .bookPlaydate(this.playDate)

       },

        //Calculate straight line distance between 2 points
        calculateDistance(pointA, pointB) {
            const radius = 2958.8; //   Radius of Earth in miles

            let rlatA = pointA.lat * (Math.PI/180); // Convert degrees to radians
            let rlatB = pointB.lat() * (Math.PI/180); // Convert degrees to radians

            let latDiff = rlatB - rlatA; // Radian difference (latitudes)

            let lngDiff = (pointB.lng() - pointA.lng) * (Math.PI/180) // Longitudinal difference in Radians

            let distance = 2 * radius * Math.asin(Math.sqrt(Math.sin(latDiff/2)*Math.sin(latDiff/2)+Math.cos(rlatA)*Math.cos(rlatB)*Math.sin(lngDiff/2)*Math.sin(lngDiff/2)));
            return distance;
        },
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

h2 {
    white-space:pre-wrap;
    margin: 5px;
}

h3 {
    white-space:pre-wrap;
    margin-top: -5px;
}

h4 {
    white-space:pre-wrap;
    margin: 10px;
}
.pet-info {
    color: #ff5757;
}

.playdate-card {
    width: 250px;
    height: auto !important;
    border-radius: 25px;
    padding: 15px;
    margin: 25px;
    text-align: center;
    box-shadow: 0 4px 8px 0 #ffe473, 0 6px 20px 0 #ffe473;
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