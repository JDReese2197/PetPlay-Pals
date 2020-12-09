<template>
    <div class="user-profile"> <!-- One div to rule them all -->

        <div class="pet-profile-side-bar"> <!-- This is where the pet profile section goes-->
        
            <div class="pet-image"><img id = "pet-pic" src = "https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"> </div>
             <!-- Pet image/TEMPORARY IMG-->
            <div class="pet-info"> 
                
               <span> <h2>PetName</h2><h5><a href="#" class="edit-pet-profile">Edit</a></h5> </span>
                <p> Type | Breed | Size </p>
                <p> Age | Gender </p>
                <p> Personality </p>
                <p> Bio </p>
                <button id="find-a-friend">FIND A FRIEND</button> <!-- Will link to the pet playdate search page-->
            </div>
            
        </div> 

        <div class="user-info"> <!-- This is the user info section -->
            <h1>Username</h1>
            <p>info for user goes here</p>
            <button id="edit-profile">Edit Profile</button>
        </div>

        <div class="play-date-preferences"> <!-- This is the playdate info section-->
            <h1> Perfect Play Date </h1>
            <p>info for play date goes here</p>
            <button id="edit-play-date-preferences">Edit Preferences</button>
        </div>

        <div class="user-profile-nav"> <!-- This is the list of nav buttons on the user profile page-->
            <button class="nav-btn">Your Calendar</button>
            <button class="nav-btn">Register a Pet</button>
            <button class="nav-btn">Your Messages</button>
            <button class="nav-btn">Log Out</button>
        </div>

        <div class="footer"><h6>© 2020 Pet Play Pals. All Rights Reserved</h6></div>
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
    grid-template-rows: 1fr 2fr 1fr;
    grid-template-areas:
    "petbar userinfo    nav"
    "petbar preferences nav"
    "petbar footer      nav"
    ;
    grid-gap: 25px;
}
.user-info {
    grid-area: userinfo;
    width: 600px;
    
}

.play-date-preferences {
    grid-area: preferences;
    width: 600px;
}

.footer {
    grid-area: footer;
    display: flex;
    align-items: flex-end;
    justify-content: center;

}

.user-profile-nav {
    grid-area: nav;
    width: 200px;
}
.pet-profile-side-bar {
    grid-area: petbar;
    background-color: #D7FEFF;
    width: 400px;
    height: 100vh;
}

.h2 {
    color: #5CE1E6;
}

.find-a-friend {
    background-color: #5CE1E6;
}


.pet-image {
    display: flex;
    justify-content: center;
}
#pet-pic {
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 300px;
    height: 300px;
    margin: 15px;
    align-content: center;
}

.pet-info {
    align-content: center;
    text-align: center;
}

.nav-btn, #edit-profile, #edit-play-date-preferences {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    background-color: #e6615c;
    color: white;
    width: 150px;
    height: 25px;
    text-align: center;
}
#find-a-friend  {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    background-color: #5CE1E6;
    color: white;
    align-content: center;
}

span {
    display: flex;
    flex-direction: row;
    justify-content: center;
    color:  #5CE1E6;

}

a:link {
    color: rgb(39, 39, 39);
}

h1 {
    color: #e6615c;
}
</style>