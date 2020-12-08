<template>
    <form v-on:submit.prevent>
        <div class="field">
            <label for="name">First Name: </label>
            <input type="text" name="firstName" v-model="user_profile.firstName"/>
        </div>
        <div class="field">
            <label for="name">Last Name: </label>
            <input type="text" name="lastName" v-model="user_profile.lastName"/>
        </div>
        <div class="field">
            <label for="name">Address 1: </label>
            <input type="text" name="address1" v-model="user_profile.address1"/>
        </div>
        <div class="field">
            <label for="name">Address 2 *: </label>
            <input type="text" name="address2" v-model="user_profile.address2"/>
        </div>
        <div class="field">
            <label for="name">City: </label>
            <input type="text" name="city" v-model="user_profile.city"/>
        </div>
        <div class="field">
            <label for="state">State: </label>
            <select id="state" name="state" v-model="user_profile.state"/>
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
            </select>
        </div>
        <div class="field">
            <label for="name">Zip Code: </label>
            <input type="text" name="zip" v-model="user_profile.zip"/>
        </div>
        <div class="field">
            <label for="name">Email: </label>
            <input type="text" name="email" v-model="user_profile.email"/>
        </div>
        <div class="field">
            <label for="name">Phone Number: </label>
            <input type="text" name="phone" v-model="user_profile.phone"/>
        </div>
        <div class="actions">
            <button type="submit">Register User</button>
        </div>
    </form>
</template>

<script>
export default {
    name: "register",
    data() {
        return {
            user_profile: {
                userId: 1,
                firstName: "",
                lastName: "",
                address1: "",
                address2: "",
                city: "",
                state: "",
                zip: "",
                email: "",
                phone: ""
            }
        }
    }
}
</script>

<style scoped>

</style>