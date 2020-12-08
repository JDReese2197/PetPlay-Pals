<template>
<div id="register">
    <form v-on:submit.prevent>
        <div class="field">
            <label for="name">Name</label>
            <input type="text" name="name" v-model="pet.name"/>
        </div>
        <div class="field">
            <label for="age">Age</label>
            <input type="number" name="age" v-model="pet.age"/>
        </div>
        <div class="field">
            <label for="name">Type</label>
            <select id="type">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="bird">Bird</option>
                <option value="reptile">Reptile</option>
                <option value="other">Other</option>
            </select>
        </div>
         <div class="field">
            <label for="breed">Breed</label>
            <input type="text" name="breed" v-model="pet.breed"/>
        </div>
        <div class="field">
            <label for="size">Size</label>
            <input type="text" name="size" v-model="pet.size"/>
        </div>
        <div class="field">
            <label for="name">Personality</label>
            <select id="personality">
                <option value="shy">Shy, Timid</option>
                <option value="friendly">Friendly, Sweet</option>
                <option value="loving">Loving, Affectionate</option> 
                <option value="curious">Curious, Adventurous</option>
                <option value="gentle">Gentle, Laidback</option>
                <option value="active">Active, Playful</option>
                <option value="confident">Confident, String-Willed</option>
            </select>
        </div>
        <div class="field">
            <label for="bio">Bio</label>
            <input type="text" name="bio" v-model="pet.bio"/>
        </div>
        <div class="actions">
            <button type="submit">Add Pet</button>
        </div>
    </form>
</div>
</template>

<script>
export default {
    name: "add-pet",
    data() {
        return {
            pet: {
                petId: "",
                profileId: "",
                name: "",
                age: "",
                type: "",
                breed: "",
                size:"",
                personality: "",
                bio: ""
            }
        }
    }
}
</script>

<style scoped>
#register {
    font-family: Arial, Helvetica, sans-serif;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; 
    grid-template-areas: 
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
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    background-color: #29d2db;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
</style>