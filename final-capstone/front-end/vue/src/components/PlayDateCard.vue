<template>
<!-- A single playdate card-->
<div class="container">
<div data-aos="fade-up" class="playdate-card" v-if="!declined && passesFilter && passesDistance && !isBooked"> 
        <img id = "pet-img" v-bind:src = "pet.profilePhoto"/>
        <h2 class="pet-info">{{pet.petName}}</h2>
        <h3 class="pet-info">{{pet.breed}} | {{pet.gender}} | Age {{pet.age}}</h3>
        <p class="pet-info" id="pet-description"><strong>{{pet.description}}</strong></p>
        <p>{{playDate.location}}
        <br/>{{playDate.theDate}}
        <br/>{{playDate.startTime}} - {{playDate.endTime}}
        <br/>{{playDate.details}}</p>

        <div class="button-block">
            <img class="button" src="https://res.cloudinary.com/ashdav/image/upload/v1608235617/img/12_yzebmg.png" alt="Book Playdate" title="Book Playdate" v-on:click="acceptPlaydate" />
            <img class="button" src="https://res.cloudinary.com/ashdav/image/upload/v1608235617/img/13_e4js9m.png" alt="Ignore Playdate" title="Ignore Playdate" v-on:click="declined = true"/>
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
          declined: false,
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
        },
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
  },
}
</script>

<style scoped>
.container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
}

h2 {
    color: #ff5757;
}

h3 {
    line-height: 0.5;
    color: #555555;
}

h4 {
    line-height: 0.5;
    color: #555555;
}
p {
    line-height: 1.5;
}
.playdate-card {
    width: 250px;
    height: auto;
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
    width: 150px;
    height: 150px;
    margin: 5px;
    align-content: center;
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