<template>
    <div>
        <div>
            <label>
                <p>Enter current location: </p>
                <gmap-autocomplete v-on:place_changed="setPlace">
                </gmap-autocomplete>
                <button v-on:click="generatePlaydateMarkers">Search Nearby PlayDates</button>
            </label>
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
    data() {
        return {
            center: { lat: 40.367474, lng: -82.996216 },
            markers: [],
            places: [],
            currentPlace: null,
            currentZoom: 10,
            userLocation: {},
            playDateLocations: [
                // {name: "Wisconsin", lat: 44.500000, lng: -89.500000},
                // {name: "West Virginia", lat: 39.000000, lng: -80.500000},
                // {name: "Vermont", lat: 44.000000, lng: -72.699997},
                // {name: "Texas", lat: 31.000000, lng: -100.000000},
                // {name: "South Dakota",lat: 44.500000, lng: -100.000000},
                // {name: "Rhode Island", lat: 41.700001, lng: -71.500000},
                // {name: "Oregon", lat: 44.000000, lng: -120.500000}
            ]
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
            this.center = this.currentPlace.geometry.location;
            this.currentZoom = 16;

            this.playDateLocations.forEach( playDate => {
                if(playDate.lat && playDate.lng) {

                    if(this.currentPlace) {
                        const distance = this.calculateDistance(playDate, this.currentPlace);

                        console.log(`Distance between Columbus and ${playDate.name}: ${distance} miles`);

                        if(distance < 20) {
                            this.setMarker(playDate);
                        }
                    }
                }
            })
        },

        //  Method to search for parks near a set location
        /*
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
                // console.log(this.$refs.mapRef.$mapObject)
                // console.log(this.google)

                let service = new this.google.maps.places.PlacesService(this.$refs.mapRef.$mapObject)
                service.nearbySearch(request, this.searchServiceCallback)
            }
        },
        searchServiceCallback(results, status) {
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
        }, */


        //  Method to calculate the distance between two points
        //      Takes a location {lat: number, lng: number} and a marker object {position: {lat: number, lng: number}}
        calculateDistance(pointA, pointB) {
            const radius = 2958.8; //   Radius of Earth in miles
            let rlatA = pointA.lat * (Math.PI/180); // Convert degrees to radians
            let rlatB = pointB.position.lat * (Math.PI/180); // Convert degrees to radians

            let latDiff = rlatB - rlatA; // Radian difference (latitudes)

            let lngDiff = (pointB.position.lng - pointA.lng) * (Math.PI/180) // Longitudinal difference in Radians

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