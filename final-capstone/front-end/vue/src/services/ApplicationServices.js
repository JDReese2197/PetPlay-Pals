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
    getProfileById(userId) {
        return http.get(`/profile/${userId}`) /*updated from /profile?user_id=${userId}*/
    },
    // Need to set up getProfileByUsername on backend 
    /* getUserProfileByUsername(currentUser) {
        return http.get(`/profile?username=${currentUser}`)
    },*/
    updateUserProfile(userProfile) {
        return http.put(`/update/profile`, userProfile)
    },
    getPetByPetId(petId) {
        return http.get(`/pet/${petId}`)
    },
    getPetByProfileId(profileId) {
        return http.get(`/profile/pets/${profileId}`);
    },
    getAPetByProfileId(profileId) {
        return http.get(`/profile/pet/${profileId}`);
    },
    getPostingsWithoutBooking() {
        return http.get(`/display/postings`);
    },
    getPlaydateByPlaydateId(profileId) {
        return http.get(`/playdate/${profileId}`);
    },
    displayAcceptedInvite(petId) {
        return http.get(`/display/invites/${petId}`);
    }
}