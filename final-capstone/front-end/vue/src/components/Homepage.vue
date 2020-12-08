<template>
    <div class="home">
        <div class="main">
            <header>
                <img src="https://cdn.freebiesupply.com/logos/large/2x/tinder-1-logo-black-and-white.png" />
                <button id="login">Login</button>
            </header>
            <section class="greeting">
                <h1>Welcome</h1>
                <button id="signup">Sign Up</button>
            </section>
        </div>
        <body>
            <!--Homepage graphic goes here-->
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
.main {
    background-image: url(https://besthqwallpapers.com/Temp/8-12-2020/cavalier-king-charles-spaniel-black-cat-pets-dogs-friendship-besthqwallpapers.com-1920x1080.jpg);
    background-size: cover;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
    grid-template-areas: 
        "header"
        "section"
        ".";
}
header {
    grid-area: header;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}
img {
    width: 75px;
    height: 25px;
    padding: 3px 10px;
}
section {
    grid-area: section;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
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
    color: #1aebeb;
    padding: 3px 10px;
}
#signup {
    background-color: #1aebeb;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
footer {
    background-color: #1aebeb;
    color: #555555;
    text-align: center;
    font-size: 12px;
    padding: 10px;
}

</style>