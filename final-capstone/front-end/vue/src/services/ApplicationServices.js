/**************************************************************************************
* This file is provided for you to use for any Application services you may create
*
*  If you would prefer a file with a different name for your services, 
*     simply create one 
***************************************************************************************/
import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
});

export default {
    addPet(pet) {
        return http.post(`/register/pet`, pet)
    },
    registerUserProfile(userProfile) {
        return http.post(`/register/profile`, userProfile)
    },
    getUserById(userId) {
        return http.get(`/profile?user_id=${userId}`)
    },
    // Need to set up getProfileByUsername on backend 
    /* getUserProfileByUsername(currentUser) {
        return http.get(`/profile?username=${currentUser}`)
    },*/
    updateUserProfile(userProfile) {
        return http.put(`/update/profile`, userProfile)
    }
}