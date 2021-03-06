import Vue from 'vue'
import Router from 'vue-router'
// import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import UserProfileForm from '@/views/UserProfileForm'
import store from '../store/index'
import AddPetForm from '@/views/AddPetForm.vue'
import Homepage from '@/views/Homepage.vue'
import ProfilePage from '@/views/ProfilePage.vue'
import PlayDateSearchPage from '@/views/PlayDateSearchPage.vue'
import Schedule from '@/views/SchedulePage.vue'
import PostPlaydateForm from '@/views/PostPlaydateForm.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    /*{
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },*/
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/updateProfile",
      name: "user-profile-form",
      component: UserProfileForm
    },
    {
      path: "/createProfile",
      name: "create-profile-form",
      component: UserProfileForm
    },
    {
      path: "/addPet",
      name: "add-pet",
      component: AddPetForm
    }, 
    {
      path: "/registerpet",
      name: "registerpet",
      component: AddPetForm
    },
    {
      path: "/",
      name: "homepage",
      component: Homepage
    },
    {
      path: "/profile/:profileId",
      name: "profile-page",
      component: ProfilePage
    },
    {
      path: "/find-a-playdate",
      name: "find-a-playdate",
      component: PlayDateSearchPage
    },
    {
      path: "/schedule",
      name: "schedule",
      component: Schedule
    },
    {
      path:"/postPlaydate",
      name: "post-playdate",
      component: PostPlaydateForm
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
