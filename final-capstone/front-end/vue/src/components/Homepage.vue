<template>
    <div class="home">
        <div class="main">
            <header>
                <img src="https://cdn.freebiesupply.com/logos/large/2x/tinder-1-logo-black-and-white.png" />
                <button id="login">Login</button>
            </header>
            <div class="welcome">
                <h1>Welcome</h1>
                <button id="signup">Sign Up</button>
            </div>
        </div>
        <body>
            <img src="HomeGraphic_Full.PNG"><img/>
        </body>
        <footer> 
            <p>© 2020 Pet Play Pals. All Rights Reserved</p>
        </footer>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>

.home {
    font-family: Arial, Helvetica, sans-serif;
    display: flex;
    flex-direction: column;
}
img {
    width: 75px;
    height: 25px;
    padding: 3px 10px;
}
.main {
    background-image: url(https://besthqwallpapers.com/Uploads/5-5-2018/51220/thumb2-cavalier-king-charles-spaniel-black-cat-pets-dogs-friendship.jpg);
    background-size: cover;
    display: flex;
    flex-direction: column;
}
.welcome {
    display: flex;
    flex-direction: column;
}
h1 {
    color: white;
    font-size: 4rem;
    text-align: center;
}
button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
}
#login {
    background-color: white;
    color: #33FFFF;
    padding: 3px 10px;
}
header {
    display: flex;
    justify-content: space-between;
}
#signup {
    background-color: #33FFFF;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
    flex-grow: none;
}
footer {
    background-color: #33FFFF;
    color: #555555;
    text-align: center;
    font-size: 12px;
    padding: 10px;
}

</style>