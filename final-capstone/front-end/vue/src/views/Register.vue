<template>
  <div id="register" class="text-center">
    <div class="header">
      <router-link v-bind:to="{name: 'homepage'}"><img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1608076755/img/6_uhrhmd.png"/></router-link>
    </div>
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="field">
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
      </div>
      <div class="field">
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
      </div>
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
      <br/>
      <br/>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import TopHomeBar from '../components/TopHomeBar.vue';
import authService from '../services/AuthService';

export default {
  name: 'register',
  components: {
    TopHomeBar
  },
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              authService
                .login(this.user)
                .then(response => {
                  if (response.status == 200) {
                    this.$store.commit("SET_AUTH_TOKEN", response.data.token);
                    this.$store.commit("SET_USER", response.data.user);
                    this.$router.push(`/updateProfile`); /*path updated by AD*/
                  }
              })
              /*this.$router.push({ - CODE PROVIDED
                path: '/login',
                query: { registration: 'success' },
              });*/
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
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
    color: #29d2db;
}
#register {
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
