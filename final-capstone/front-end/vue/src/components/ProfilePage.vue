<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
            <img src = "https://res.cloudinary.com/ashdav/image/upload/v1607440049/img/cxk6sloi51lhdwindzxi.png"> <!-- Pet image/TEMPORARY IMG-->
            <div class="pet-info"> 
                <button id="edit-pet-profile">Edit</button>
            </div>
            <button id="find-a-friend">FIND A FRIEND</button> <!-- Will link to the pet playdate search page-->
        </div> 

        <div class="user-info"> <!-- This is the user info section -->
            <p>info for user goes here</p>
            <button id="edit-profile">Edit Profile</button>
        </div>

        <div class="play-date-preferences"> <!-- This is the playdate info section-->
            <h1> Perfect Play Date </h1>
            <p>info for play date goes here</p>
            <button id="edit-play-date-preferences">Edit Preferences</button>
        </div>

        <div class="user-profile-nav-buttons"> <!-- This is the list of nav buttons on the user profile page-->
            <button id="calendar">Your Calendar</button>
            <button id="register-pet">Register a Pet</button>
            <button id="messages">Your Messages</button>
            <button id="log-out">Log Out</button>
        </div>

    </div>
    <!-- -->
</template>

<script>
export default {
    
}
</script>

<style scoped>

</style>