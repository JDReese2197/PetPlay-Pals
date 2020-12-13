<template>
    <div>
        <div>
            <label>
                <p>Enter current location: </p>
                <gmap-autocomplete v-on:place_changed="setPlace">
                </gmap-autocomplete>
                <button v-on:click="generatePlaydateMarkers">Search Nearby PlayDates</button>
            </label>
            <label for="distance-selector"/>
            <select id="distance-selector" v-model="searchDistance">
                <option value="5" >5</option>
                <option value="10" >10</option>
                <option value="15" >15</option>
                <option value="20" >20</option>
                <option value="25" >25</option>
                <option value="999999">Unlimited</option>
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
    data() {
        return {
            center: { lat: 40.367474, lng: -82.996216 },
            markers: [],
            places: [],
            currentPlace: null,
            currentZoom: 10,
            userLocation: {},
            searchDistance: 0,
            playDateLocations: [
                {name: "Cleveland MetroParks Zoo", lat: 41.4459344, lng: -81.7126134},
                {name: "Bonnie Park", lat: 41.33319669999999, lng: -81.83356289999999},
                {name: "Lakewood Park", lat: 41.4948088, lng: -81.7971556},
                {name: "Peninsula Township", lat: 44.8839492, lng: -85.50972259999999},
                {name: "Edgewater Park", lat: 41.4902896, lng: -81.73545519999999},
                {name: "Jackson Hole Ski Area", lat: 43.5965946, lng: -110.8474344},
                {name: "Estes Park", lat: 40.3772059, lng: -105.5216651},
                {name: "Yellowstone National Park", lat: 44.427963, lng: -110.588455},
                {name: "Schuylkill River Park", lat: 39.9910906, lng: -75.1964947},
                {name: "Wissahickon Creek", lat: 40.1323551, lng: -75.22288089999999},
                {name: "Fairmount Park", lat: 39.9857859, lng: -75.21564}
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
            this.markers = [];

            this.center = {lat: this.currentPlace.geometry.location.lat(), lng: this.currentPlace.geometry.location.lng()};
            this.currentZoom = 14;

            this.playDateLocations.forEach( playDate => {
                if(playDate.lat && playDate.lng) {

                    if(this.currentPlace) {
                        console.log("currentPlace: " + this.currentPlace.geometry.location)
                        const distance = this.calculateDistance(playDate, this.currentPlace.geometry.location);

                        console.log(`Distance between Columbus and ${playDate.name}: ${distance} miles`);

                        if(distance < this.searchDistance) {
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