<template>
    <div data-aos="fade-up" class="playdate-card"> <!-- A single playdate card-->
        <img id="pet-img" src="https://res.cloudinary.com/ashdav/image/upload/v1607446820/img/vpmojnjrpjcy8nkswgak.jpg"/>
        <h1>Pet Name</h1>
        <p> etc </p>
        <p> etc </p>
        <p> etc </p>
    </div>
</template>

<script>
export default {
  components: {  },
    name: "play-date-card",
    props: ['cards']
}
</script>

<style scoped>
.playdate-card {
    width: 300px;
    height: auto !important;
    border-radius: 25px;
    background-image: linear-gradient(#39cfd4, #7bf4f8);
    padding: 5px;
    text-align: center;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
    /* display: flex;
    flex-direction: column; */
    /* border-style: solid;
    border-width: 2px;
    border-color:  #5CE1E6; */
}

#pet-img {
    border-radius: 50%;
    object-fit: cover;
    object-position: center top;
    width: 150px;
    height: 150px;
    margin: 5px;
    align-content: center;
    
}
</style>