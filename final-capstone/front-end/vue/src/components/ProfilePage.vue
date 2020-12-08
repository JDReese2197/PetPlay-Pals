<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
        <!-- https://res.cloudinary.com/ashdav/image/upload/v1607440049/img/cxk6sloi51lhdwindzxi.png -->
            <img src = "https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"> <!-- Pet image/TEMPORARY IMG-->
            <div class="pet-info"> 
                <button id="edit-pet-profile">Edit</button>
                <h2>PetName</h2>
                <p> Type | Breed | Size </p>
                <p> Age | Gender </p>
                <p> Personality </p>
                <p> Bio </p>
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

        <div class="user-profile-nav"> <!-- This is the list of nav buttons on the user profile page-->
            <button id="calendar">Your Calendar</button>
            <button id="register-pet">Register a Pet</button>
            <button id="messages">Your Messages</button>
            <button id="log-out">Log Out</button>
        </div>

        <div class="footer">© 2020 Pet Play Pals. All Rights Reserved</div>
    </div>
    <!-- -->
</template>

<script>
export default {
    
}
</script>

<style scoped>
.user-profile {
    font-family: Arial, Helvetica, sans-serif;
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    grid-template-areas:
    "petbar userinfo    nav"
    "petbar preferences nav"
    "petbar footer      nav"
    ;

    grid-gap: 15px;
}

.pet-profile-side-bar {
    grid-area: petbar;
    background-color: #D7FEFF;
}

.h2 {
    color: #5CE1E6;
}

.find-a-friend {
    background-color: #5CE1E6;
}

.user-info {
    grid-area: userinfo;
}

.play-date-preferences {
    grid-area: preferences;
}

.footer {
    grid-area: footer;
}

.user-profile-nav {
    grid-area: nav;
}
</style>