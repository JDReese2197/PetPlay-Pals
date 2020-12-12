<template>
    <div class="Schedule"> <!-- One div to rule them all -->

        <div class="playdate-info"> <!-- This is the user info section -->
            <h1>Playdate Schedule</h1>
            <p>{{this.$store.state.pet.petName}} has a playdate with {{playdate.petBookerId}}</p>
            <p>On: {{playdate.theDate}} from {{playdate.startTime}} to {{playdate.endTime}}</p>
            <p>At location: {{playdate.location}}</p>
            <p>Details: {{playdate.details}}</p>
            <!--<router-link v-bind:to="{name: 'playdate-form'}"><button id="edit-profile">Button possibly to cancel date</button></router-link> -->
        </div>

        <footer-bar class="footer"/>
        <div><h6><a href="https://media1.tenor.com/images/c65f4fdd955cdc6614899b0a38b8473e/tenor.gif?itemid=5648271">
        © 2020 Pet Play Pals. All Rights Reserved</a></h6>
        </div>
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';
import footerBar from '@/components/FooterBar';

export default {
    components: { 
        footerBar
    },
    props: "Schedule", 
    data() {
        return {

        }
    },
    methods: {
        retrievePlayDate() {
            applicationServices
                .getPlayDateByPlayDateId(this.$store.state.profile.profileId)
                .then(response => {
                    if(response.status === 200) {
                         this.$store.commit("SET_PLAYDATE", response.data)
                    }
                })
                .catch(error => {
                    const response = error.response
                    console.log(response)
                         console.log(this.$store.state.pet.petName)
                         console.log(this.$store.state.pet)
                         console.log(this.$store.state.playdate)
                         console.log(this.$store.state.playdate.location)
                })
        }
        },
    created() {
        this.retrievePlaydate();
    },
    computed: {
        playDate() {
            return this.$store.state.playdate;
        }
    }
}
</script>

<style scoped>

</style>