<template>
  <div id="login" class="text-center">
    <div class="header">
      <router-link v-bind:to="{name: 'homepage'}"><img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1608076755/img/6_uhrhmd.png"/></router-link>
    </div>
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <br/>
      <br/>
      <button type="submit">Sign in</button>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";
// import applicationServices from "@/services/ApplicationServices"

export default {
  name: "login",
  components: {},
  props: ["user_profile"], /* added by AD*/
  data() {
    return {
      profileId: 0, /*added by AD*/
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push(`/profile/${this.$store.state.profile.profileId}`); /*path updated by AD*/
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
    setProfileId() { /*added by AD*/
      this.profileId = this.$store.state.user.id;
    }
  },
  created() { /*added by AD*/
    this.setProfileId()
  }
};
</script>

<style scoped>
#logo {
  grid-area: logo;
    width:150px;
    height: auto;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 5px;
}
h1 {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    color: #ff5757;
}
#login {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; 
    grid-template-areas: 
        "header header header"
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
    background-color: #ff5757;
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
button:hover {
    background-image: linear-gradient(to right, #5ce1e6, #ff5757, #ffe473);
}
</style>