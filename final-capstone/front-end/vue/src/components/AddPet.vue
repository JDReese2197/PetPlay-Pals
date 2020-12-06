<template>
    <form v-on:submit.prevent>
        <div class="field">
            <label for="name">Type</label>
            <select id="type">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
            </select>
        </div>
        <div class="field">
            <label for="name">Name</label>
            <input type="text" name="name" v-model="pet.name"/>
        </div>
        <div class="field">
            <label for="age">Age</label>
            <input type="number" name="age" v-model="pet.age"/>
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
        <div class="actions">
            <button type="submit">Add Pet</button>
        </div>
    </form>
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
                type: "",
                age: "",
                personality: ""
            }
        }
    }
}
</script>

<style scoped>

</style>