<template>
    <div id="post">
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
                <button type="submit" v-on:click="submitPlaydate">Post</button>
            </div>
            <br/>
            <br/>
            <br/>
        </form>
    </div>
</template>

<script>

import applicationServices from '@/services/ApplicationServices';

export default {
    name: "post-playdate",
    errorMsg: "",
    data() {
        return {
            playdate: {
                petPoster: null,
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
                .postPlaydate(this.playdate)
                .then(response => {
                    console.log("got to if statement")
                    if (response.status === 200) {
                        this.$router.push(`/find-a-playdate`);
                    }
                })
                .catch(error => {
                        this.handleErrorResponse(error, "Posting Playdate")
                });
        },
        handleErrorResponse(error, verb) {
            console.log("error handling")
            if (error.response) {
            this.errorMsg =
                "Error " + verb + " Post Playdate. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
                this.errorMsg =
                "Error " + verb + " Post Playdate. Server could not be reached.";
            } else {
                this.errorMsg =
                "Error " + verb + " Post Playdate. Request could not be created.";
            }
        }
    }
}
</script>

<style scoped>
#post {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; 
    grid-template-areas: 
        ". form .";
}
form {
    grid-area: form;
    line-height: 20px;
}
input {
    width: 100%;
    padding: 10px 10px;
    margin: 8px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
}
.field {
    margin: 5px 0;
}
label {
    font-weight: bold;
    color: #555555;
}
select {
    width: 100%;
    padding: 10px 10px;
    margin: 8px 0;
    box-sizing: border-box;
    font-size: 15px;
    color: #555555;
}
button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    background-color: #29d2db;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
</style>