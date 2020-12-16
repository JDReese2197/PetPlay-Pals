import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user')); // username


if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    profile: {},
    playDates: [],
    pet: {},
    pets: [],
    playDate: {},

    petFilter: {
    },
    distanceFilter: 0,
    location: {},

    states: [
      "Alabama", 
      "Alaska",
      "Arizona",
      "Arkansas",
      "California",
      "Colorado",
      "Connecticut",
      "Delaware",
      "Florida",
      "Georgia",
      "Hawaii",
      "Idaho",
      "Illinois",
      "Indiana",
      "Iowa",
      "Kansas",
      "Kentucky",
      "Louisiana",
      "Maine",
      "Maryland",
      "Massachusetts",
      "Michigan",
      "Minnesota",
      "Mississippi",
      "Missouri",
      "Montana",
      "Nebraska",
      "Nevada",
      "New Hampshire",
      "New Jersey",
      "New Mexico",
      "New York",
      "North Carolina",
      "North Dakota",
      "Ohio",
      "Oklahoma",
      "Oregon",
      "Pennsylvania",
      "Rhode Island",
      "South Carolina",
      "South Dakota",
      "Tennessee",
      "Texas",
      "Utah",
      "Vermont",
      "Virginia",
      "Washington",
      "West Virginia",
      "Wisconsin",
      "Wyoming"
    ]
  },
  mutations: {
    SET_LOCATION(state, location) {
      state.location = location;
    },
    SET_PET_FILTER(state, filter) {
      state.petFilter = filter;
    },
    SET_DISTANCE_FILTER(state, distance) {
      state.distanceFilter = distance;
    },

    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};

      localStorage.removeItem('profile')
      localStorage.removeItem('pet')
      state.pets = [];
      state.pet = {};
      state.profile = {};
      state.petFilter = {};
      state.distanceFilter = 0;

      axios.defaults.headers.common = {};
    },
    SET_PROFILE(state, profile) {
      state.profile = profile;
    },
    SET_PET(state, pet) {
      state.pet = pet;
    },
    SET_PETS(state, pets) {
      state.pets = pets;
      if(pets[0]) {
        state.pet = pets[0]
      }
    },
    SET_PLAYDATE(state, playDate) {
      state.playDate = playDate;
    }
  }
})
