<template>
    <div>
        <div>
            <h1>WARNING! AUTHORIZED PERSONEL ONLY! WARNING!</h1>
            <h2>Testing grounds for google maps API</h2>
            <label>
                <gmap-autocomplete v-on:place_changed="setPlace">
                </gmap-autocomplete>
                <button v-on:click="searchParks">Add</button>
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
// import applicationServices from '@/services/ApplicationServices';

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
        searchParks() {
            if(this.currentPlace) {
                const request = {
                    location: {
                        lat: this.currentPlace.geometry.location.lat(),
                        lng: this.currentPlace.geometry.location.lng()
                    },
                    radius: 2400,
                    type: ['park']
                }
                console.log(this.$refs.mapRef.$mapObject)
                console.log(this.google)
                let service = new this.google.maps.places.PlacesService(this.$refs.mapRef.$mapObject)
                service.nearbySearch(request, this.callback)
            }
        },
        callback(results, status) {
            if(status == this.google.maps.places.PlacesServiceStatus.OK) {
                for(let i = 0; i < results.length; i++) {
                    console.log(results[i])
                    let aPlace = {
                        lat: results[i].geometry.location.lat(), 
                        lng: results[i].geometry.location.lng()
                    }
                    this.setMarker(aPlace)
                }
                this.center = {
                    lat: this.currentPlace.geometry.location.lat(),
                    lng: this.currentPlace.geometry.location.lng()
                }
                this.currentZoom = 13;
            }
        },
        // testGetPets() {
        //     console.log(this.$store.state.user.id)
        //     applicationServices
        //         .getPetsByUserId(this.$store.state.user.id)
        //         .then(response => {
        //             console.log(response)
        //             if(response.status === 200) {
        //                 this.$store.commit('SET_PETS', response.data)
        //             }
        //         })
        //         .catch(error => {
        //             console.log(error)
        //         })
        // }
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
    created() {
        // this.testGetPets();
    }
}
</script>

<style scoped>

</style>