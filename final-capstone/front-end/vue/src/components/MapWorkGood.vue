<template>
    <div>
        <div>
            <h2></h2>
            <label>
                <gmap-autocomplete v-on:place_changed="setPlace">
                </gmap-autocomplete>
                <button v-on:click="addMarker">Add</button>

            </label>
            <br/>

        </div>
        <br>
        <gmap-map ref="mapRef"
        :center='center'
        :zoom='currentZoom'
        :options='{disableDefaultUI: true, zoomControl: true, fullscreenControl: true}'
        style="width:100%;  height: 400px;"
        >
        <gmap-marker
            :key="index"
            v-for="(m, index) in markers"
            :position="m.position"
            :clickable="true"
            @click="center=m.position"
        ></gmap-marker>
        </gmap-map>
    </div>
</template>

<script>
import {gmapApi} from 'vue2-google-maps'

export default {
    name: "MapWorkGood",
    data() {
        return {
            center: { lat: 40.367474, lng: -82.996216 },
            markers: [],
            places: [],
            currentPlace: null,
            currentZoom: 10,
            userLocation: {},
            playDateLocations: [
                {lat: 44.500000, lng: -89.500000},
                {lat: 39.000000, lng: -80.500000},
                {lat: 44.000000, lng: -72.699997},
                {lat: 31.000000, lng: -100.000000},
                {lat: 44.500000, lng: -100.000000},
                {lat: 41.700001, lng: -71.500000},
                {lat: 44.000000, lng: -120.500000}
            ]
        }
    },
    methods: {
        setPlace(place) {
            this.currentPlace = place;
            console.log(place)
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
            console.log(this.currentPlace)
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
        geolocate: function() {
            navigator.geolocation.getCurrentPosition(position => {
                this.center = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                this.userLocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                }
            })
        },
        generatePlaydateMarkers() {
            this.playDateLocations.forEach( pos => {
                if(pos.lat && pos.lng) {
                    this.setMarker(pos)
                }
            })
        },
    },
    computed: {
        google: gmapApi
    },
    components: {
        
    },
    mounted() {
        this.geolocate();
        this.generatePlaydateMarkers();
    },
}
</script>

<style scoped>

</style>