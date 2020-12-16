<template>
    <div>
        <button v-on:click="testMethod">I probly do something</button>
        <br>
            <gmap-map ref="mapRef"
            :center='center'
            :zoom='currentZoom'
            :options='{disableDefaultUI: true, zoomControl: true, fullscreenControl: true}'
            style="width: 600px;  height: 300px; margin: auto;"
            >
                <gmap-marker
                    :key="index"
                    v-for="(m, index) in playDates"
                    :position="{lat: m.lat, lng: m.lng}"
                    :clickable="true"
                    v-on:click="center=m.position"
                ></gmap-marker>
        </gmap-map>
    </div>
</template>

<script>
import {gmapApi} from 'vue2-google-maps'

export default {
    name: "PlayDateMap",
    props: ['playDates'],
    data() {
        return {
            center: {lat: 41.49932, lng: -81.6943605},
            markers: [],
            places: [],
            currentZoom: 10,
            userLocation: {},
        }
    },
    methods: {
        testMethod() {
            console.log(this)
        },
        setPlace(place) {
            this.currentPlace = place;
        },
        addMarker() {
            if(this.currentPlace) {
                const marker = {
                    lat: this.currentPlace.geometry.location.lat(),
                    lng: this.currentPlace.geometry.location.lng()
                };
                this.markers.push({position: marker})
                this.places.push(this.currentPlace)
                this.center = marker
            }
        },
        setMarker(place) {
            if(place) {
                const marker = {
                    lat: place.lat,
                    lng: place.lng
                }
                this.markers.push({position: marker})
                this.places.push(place)
            }
        },

        //  Method to calculate the distance between two points
        //      Takes a location {lat: number, lng: number} and a marker object {position: {lat: number, lng: number}}
        calculateDistance(pointA, pointBPlace) {
            const radius = 2958.8; //   Radius of Earth in miles
            const pointB = pointBPlace.geometry.location

            let rlatA = pointA.lat * (Math.PI/180); // Convert degrees to radians
            let rlatB = pointB.lat() * (Math.PI/180); // Convert degrees to radians

            let latDiff = rlatB - rlatA; // Radian difference (latitudes)

            let lngDiff = (pointB.lng() - pointA.lng) * (Math.PI/180) // Longitudinal difference in Radians

            let distance = 2 * radius * Math.asin(Math.sqrt(Math.sin(latDiff/2)*Math.sin(latDiff/2)+Math.cos(rlatA)*Math.cos(rlatB)*Math.sin(lngDiff/2)*Math.sin(lngDiff/2)));
            return distance;
        },
    },
    computed: {
        google: gmapApi,

        //  Methods being used to filter markers to only those that are within range

        // getLocation() {
        //     return this.$store.state.location
        // },
        // getDistance() {
        //     return this.$store.state.distanceFilter
        // },
        // filteredPlaydates() {
        //     const playdates = this.playDates;
        //     let location = (this.$store.state.location ? null : this.getLocation);
        //     let searchDistance = this.getDistance;

        //     console.log(location)
        //     console.log(searchDistance)

        //     return playdates.filter(playdate => {
        //         if(location && playdate.lat && playdate.lng) {
        //             const distance = this.calculateDistance(playdate, location);

        //             if(searchDistance === 0 || searchDistance < distance) {
        //                 return true;
        //             }
        //         }
        //         else if(!location) {
        //             return true;
        //         }

        //         return false;
        //     })
        // },
        // filterMarker(place) {
        //     console.log(place)
        //     const playdate = place;
        //     let location = this.getLocation;
        //     let searchDistance = this.getDistance;

        //     if(location && playdate.lat && playdate.lng) {
        //         const distance = this.calculateDistance(playdate, location.geometry.location);

        //         if(searchDistance === 0 || searchDistance < distance) {
        //             return true;
        //         }
        //     }
        //     else if(!location) {
        //         return true
        //     }

        //     return false;
        // },
    },
}
</script>

<style scoped>

</style>