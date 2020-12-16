<template>
    <div>
        <br>
            <gmap-map class="map" ref="mapRef"
            :center='center'
            :zoom='10'
            :options='{disableDefaultUI: true, zoomControl: true, fullscreenControl: true}'
            >
                <gmap-info-window
                    :options="infoOptions"
                    :position="infoWindowPos"
                    :opened="infoOpen"
                    v-on:click="toggleInfo(m, index)"
                >
                    <div v-html="infoContent"></div>
                </gmap-info-window>

                <gmap-marker
                    :key="index"
                    v-for="(m, index) in filteredPlaydates"
                    :position="{lat: m.lat, lng: m.lng}"
                    :clickable="true"
                    v-on:click="markerIndex=index, toggleInfo(m, index)"
                    v-on:closeclick="infoOpen=false"
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
            markerIndex: null,  //  Marker index will start at 1, making it 1 higher than it's index in the array of playdates
            center: {
                lat: 41.49932, 
                lng: -81.6943605
            },
            infoContent: '',
            userLocation: {},
            infoWindowPos: {
                lat: 0,
                lng: 0
            },
            infoOpen: false,
            infoOptions: {
                pixelOffset: {
                    width: 0,
                    height: -20
                }
            }
        }
    },
    methods: {
        //  Toggle info window on map.
        toggleInfo: function(playdate, index) {
            this.infoWindowPos = {lat: playdate.lat, lng: playdate.lng};
            console.log(playdate)
            this.infoContent = this.getInfoWindowContent(playdate);

            if(this.markerIndex == index) {
                this.infoOpen = !this.infoOpen;
            }
            else {
                this.infoOpen = true;
                this.markerIndex = index;
            }
        },

        //  Sets content for displaying in info window
        getInfoWindowContent: function (playdate) {
            return (`<div>
                        <h4>${playdate.theDate}</h4>
                        <h4>${playdate.startTime} - ${playdate.endTime}</h4>
                        <h5>${playdate.details}</h5>
                    </div>`)
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

        getLocation() {
            return this.$store.state.location
        },
        getDistance() {
            return this.$store.state.distanceFilter
        },
        //  Filters playdats to be displayed on map
        filteredPlaydates() {
            const playdates = this.playDates;
            let location = this.getLocation
            let searchDistance = this.getDistance;

            console.log(location)
            console.log(searchDistance)

            return playdates.filter(playdate => {
                if(location.geometry && playdate.lat && playdate.lng) {
                    const distance = this.calculateDistance(playdate, location);

                    if(searchDistance == 0 || searchDistance > distance) {
                        return true;
                    }
                }
                else if(!location.geometry) {
                    return true;
                }

                return false;
            })
        }
    },
}
</script>

<style scoped>
.map {
    width: auto;  
    height: 300px; 
    margin: auto;
}
</style>