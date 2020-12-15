<template>
    <div>
        <div>
            <label>
                <p>Enter current location: </p>
                <gmap-autocomplete v-on:place_changed="setPlace">
                </gmap-autocomplete>
                <button v-on:click="generatePlaydateMarkers">Search Nearby PlayDates</button>
            </label>
            <label for="distance-selector">Distance to search: </label>
            <select id="distance-selector" v-model="searchDistance">
                <option value="5" >5 Miles</option>
                <option value="10" >10 Miles</option>
                <option value="15" >15 Miles</option>
                <option value="20" >20 Miles</option>
                <option value="25" >25 Miles</option>
                <option value="0">Unlimited</option>
            </select>
            <br/>

        </div>
        <br>
        <gmap-map ref="mapRef"
        :center='center'
        :zoom='currentZoom'
        :options='{disableDefaultUI: true, zoomControl: true, fullscreenControl: true}'
        style="width: 600px;  height: 300px; margin: auto;"
        >
        <gmap-marker
            :key="index"
            v-for="(m, index) in markers"
            :position="m.position"
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
            center: { lat: 40.367474, lng: -82.996216 },
            markers: [],
            places: [],
            currentPlace: null,
            currentZoom: 10,
            userLocation: {},
            searchDistance: 0,
        }
    },
    methods: {
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
        generatePlaydateMarkers() {
            this.markers = [];

            this.center = {lat: this.currentPlace.geometry.location.lat(), lng: this.currentPlace.geometry.location.lng()};

            this.playDates.forEach( playDate => {
                if(playDate.lat && playDate.lng) {

                    if(this.currentPlace) {
                        console.log("currentPlace: " + this.currentPlace.geometry.location)
                        const distance = this.calculateDistance(playDate, this.currentPlace.geometry.location);

                        console.log(`Distance between ${this.currentPlace.formatted_address} and ${playDate.location}: ${distance} miles`);

                        if(distance < this.searchDistance || this.searchDistance == 0) {
                            this.setMarker(playDate);
                        }
                    }
                }
            })
        },

        //  Method to calculate the distance between two points
        //      Takes a location {lat: number, lng: number} and a marker object {position: {lat: number, lng: number}}
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
    computed: {
        google: gmapApi
    },
    components: {
        
    },
    mounted() {
    },
}
</script>

<style scoped>

</style>