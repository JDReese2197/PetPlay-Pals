<template>
    <div>
        <h1>Register Your Pet</h1>
        <add-pet />
    </div>
</template>

<script>

import addPet from "@/components/AddPet";

export default {
    components: {
        addPet
    }
}
</script>

<style scoped>
h1 {
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;
}
</style>