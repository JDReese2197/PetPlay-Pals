<template>
    <div class="home">
        <!-- eslint-disable --> <!-- This disables annoying eslink warning messages in the html       -->
        <!-- This is the dropzone component that will give a place to drop the image to be uploaded -->
        <!-- there are two custom events the component listens for:                                 -->
        <!--       the vdropzone-sending event which is fired when dropzone is sending an image     -->
        <!--       the vdropzone-success event which is fired when dropzone upload is successful    -->
        <!-- <vue-dropzone -->
            <!-- id="dropzone" -->
            <!-- class="mt-3" -->
            <!-- v-bind:options="dropzoneOptions" -->
            <!-- v-on:vdropzone-sending="addFormData" -->
            <!-- v-on:vdropzone-success="getSuccess" -->
            <!-- :useCustomDropzoneOptions="true" -->
        <!-- ></vue-dropzone> -->
        <div class="main">
            <header>
                <img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1607439755/img/dvcdp1esn3ry9jmbffjg.png" />
                <router-link v-bind:to="{name: 'login'}"><button class="button" id="login">Login</button></router-link>
            </header>
            <section class="greeting">
                <h1>Welcome</h1>
                <button @click="$router.push({name: 'register'})" class="button" id="signup">Sign Up</button>
            </section>
        </div>
        <body>
            <img id="home-graphic" src="https://res.cloudinary.com/ashdav/image/upload/v1607434478/img/b9wguibeb6nzbug8zrob.png"/>
        </body>
        <footer> 
            <p>© 2020 Pet Play Pals. All Rights Reserved</p>
        </footer>
    </div>
</template>

<script>
/* eslint-disable */
import vue2Dropzone from "vue2-dropzone";
//import "vue2-dropzone/dist/vue2Dropzone.min.css";
//import applicationServices from "@/services/ApplicationServices"

export default {
    name: "upload-photo",
    components: {
        //vueDropzone: vue2Dropzone
    },
    created() {
      applicationServices
        .getProfileById(this.$store.state.user.id)
        .then(response => {
            if(response.status === 200) {
                this.$store.commit("SET_PROFILE", response.data)
          }
        })
        .catch(error => {
          const response = error.response
          console.log(response)
        })
    },
    data(){
        return {
            //-------------------------------------------------------------------------------------
            // TODO: substitute your actual Cloudinary cloud-name where indicated in the URL
            //-------------------------------------------------------------------------------------
            /**dropzoneOptions: {
                url: "https://api.cloudinary.com/v1_1/ashdav/image/upload",  
                thumbnailWidth: 250,
                thumbnailHeight: 250,
                maxFilesize: 2.0,
                acceptedFiles: ".jpg, .jpeg, .png, .gif",
                uploadMultiple: false,
                addRemoveLinks: true,
                dictDefaultMessage: 'Drop files here to upload. </br> Alternatively, click to select a file for upload.',                
            },  */    
        }
    },

    //methods:{
        /******************************************************************************************
         * The addFormData method is called when vdropzone-sending event is fired
         * it adds additional headers to the request
         ******************************************************************************************/
        //--------------------------------------------------------------------------------------------
        // TODO: substitute your actual Cloudinary api-key where indicated in the following code
        // TODO: substitute your actual Cloudinary upload preset where indicated in the following code
        //----------------------------------------------------------------------------==---------------   
    /**    addFormData(file, xhr, formData) {
            formData.append("api_key", "657265325953443");                // substitute your api key
            formData.append("upload_preset", "pfjwkuav");   // substitute your upload preset
            formData.append("timestamp", (Date.now() / 1000) | 0);
            formData.append("tags", "vue-app");
        },*/
         /******************************************************************************************
         * The getSuccess method is called when vdropzone-success event is fired
         ******************************************************************************************/
        /** getSuccess(file, response) {
            const imgUrl = response.secure_url;   // store the url for the uploaded image
            this.$emit("image-upload", imgUrl);   // fire custom event with image url in case someone cares
        },*/
    //}
}
</script>


<style scoped>

.home {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    flex-direction: column;
}
.main {
    background-image: url(https://res.cloudinary.com/ashdav/image/upload/v1607434473/img/lmvvi7mkx5f2fmbdh2xi.jpg);
    background-size: cover;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr;
    grid-template-areas: 
        "header"
        "section"
        ".";
}
header {
    grid-area: header;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}
#logo {
    width:150px;
    height: auto;
    margin-top: 15px;
    margin-left: 15px;
}
section {
    grid-area: section;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
h1 {
    color: white;
    font-size: 4rem;
    text-align: center;
}
.button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
    transition-duration: 0.5s;
}

#login {
    /*background-color: white;*/
    background-image: linear-gradient(to right, #e6615c, rgb(253, 253, 130));
    font-size: 17px;
    color: white;
    padding: 5px 15px;
    margin-top: 30px;
    margin-right: 20px;
}
#signup {
    /*background-color: #29d2db;*/
    background-image: linear-gradient(to right, #29d2db, #e6615c);
    color: white;
    font-size: 20px;
    padding: 5px 15px;
}
.button:hover {
    background-image: linear-gradient(to left,rgb(253, 253, 130) , #e6615c, #29d2db);
}
body {
    display: grid;
    grid-template: 1fr 1fr 1fr; 
    grid-template-areas: 
        "."
        "graphic"
        ".";
}
#home-graphic {
    grid-area: graphic;
    width: 70%;
    height: auto;
    margin: 125px 225px 125px 175px;
}
footer {
    background-image: linear-gradient(to right, #29d2db, #e6615c, rgb(253, 253, 130));
    color: white;
    text-align: center;
    font-size: 12px;
    padding: 10px;
}

</style>