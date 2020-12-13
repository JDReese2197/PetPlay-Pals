<template>
    <div class="bar">
        <router-link v-bind:to="{name: 'homepage'}"><img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1607440049/img/cxk6sloi51lhdwindzxi.png"/></router-link>
        <h3><router-link class="link" v-bind:to="{name: 'profile'}">Profile</router-link> | <router-link class="link" v-bind:to="{name: 'logout'}">Logout</router-link></h3>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.bar {
    background-image: linear-gradient(to left,rgb(253, 253, 130) , #e6615c, #29d2db);
    padding: 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
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
    color: white;
}
.link {
    text-decoration: none;
    color: white;
}
</style>