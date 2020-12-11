import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import * as VueGoogleMaps from 'vue2-google-maps'

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyCgbTdlp630BVVWt8J44CLcqdqrumK-tzs',
    libraries: 'places,geometry'
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
