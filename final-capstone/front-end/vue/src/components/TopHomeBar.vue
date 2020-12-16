<template>
    <div class="bar">
        <div class="logo">
            <router-link v-bind:to="{name: 'homepage'}"><img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1608076755/img/6_uhrhmd.png"/></router-link>
        </div>
        <div class="login" v-if="!this.$store.state.user.id">
            <p><router-link class="link" v-bind:to="{name: 'login'}">Login</router-link></p>
        </div> 
        <div class="nav" v-else>
            <p><router-link class="link" v-bind:to="{name: 'schedule'}">My Schedule</router-link></p>
            <p><router-link class="link" v-bind:to="{name: 'find-a-playdate'}">Find Playdate</router-link></p>
            <p><router-link class="link" v-bind:to="{name: 'profile-page'}">Profile</router-link></p>
            <p> | </p>
            <p><router-link class="link" v-bind:to="{name: 'logout'}">Logout</router-link></p>
        </div>   
    </div>
</template>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          wytttt                                                                      WWWWWWWWWWWWWWWWW                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                2
<script>
export default {
}
</script>

<style scoped>
.bar {
    padding: 5px;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas: 
        "logo logo nav";
}
.logo {
    grid-area: logo;
}
.nav {
    grid-area: nav;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
}
#logo {
    width:150px;
    height: auto;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 5px;
}
h3 {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin-right: 5px;
    color: #555555;
}
.link {
    text-decoration: none;
    color: #555555;
}
p {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #555555;
    text-transform: uppercase;
    text-align: right;
    margin-right: 10px;
}
.link:hover {
    color: #ffe473;
}
</style>