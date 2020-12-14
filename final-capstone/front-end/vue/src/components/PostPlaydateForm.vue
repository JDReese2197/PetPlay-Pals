<template>
    <div id="schedule">
        <form v-on:submit.prevent>
            <div class="field">
                <label for="theDate">Date</label>
                <input 
                    type="date" 
                    name="theDate"
                    v-model="playdate.theDate"
                    required
                />
            </div>
            <div class="field">
                <label for="startTime">Start Time</label>
                <input 
                    type="time"
                    name="startTime"
                    v-model="playdate.startTime"
                    required
                />
            </div>
            <div class="field">
                <label for="endTime">End Time</label>
                <input
                    type="time"
                    name="endTime"
                    v-model="playdate.endTime"
                    required
                />
            </div>
            <div class="field">
                <label for="theLocation">Location</label>
                <input
                    type="search"
                    name="theLocation"
                    v-model="playdate.theLocation"
                    required
                />
            </div>
            <div class="field">
                <label for="details">Additional Details</label>
                <input
                    type="text"
                    name="details"
                    v-model="playdate.details"
                />
            </div>
            <br/>
            <div class="actions">
                <button type="submit" v-on:click="submitPlaydate">Submit</button>
            </div>
        </form>
        <br/>
        <br/>
        <br/>
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';

export default {
    data() {
        return {
            playdate: {
                petPoster: null,
                petBooker: null,
                theDate: "",
                startTime: "",
                endTime: "",
                theLocation: "",
                details: ""
            }
        }
    },
    created() {
        this.setPosterId();
    },
    methods: {
        setPosterId() {
            this.playdate.petPoster = this.$store.state.user.id;
        },
        submitPlaydate() {
            applicationServices
                .postPlaydate(playdate)
                .then(response => {
                    if (response.status === 200) {
                        this.$router.push(`/find-a-playdate`);
                    }
                })
                .catch(error => {
                        this.handleErrorResponse(error, "Adding Playdate")
                });
        },
        handleErrorResponse(error, verb) {
            if (error.response) {
            this.errorMsg =
                "Error " + verb + " User Profile. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
                this.errorMsg =
                "Error " + verb + " User Profile. Server could not be reached.";
            } else {
                this.errorMsg =
                "Error " + verb + " User Profile. Request could not be created.";
            }
        }
    }
}
</script>

<style scoped>

</style>