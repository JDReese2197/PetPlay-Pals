<template>
    <div class="home">
        <!-- eslint-disable --> <!-- This disables annoying eslink warning messages in the html       -->
        <!-- This is the dropzone component that will give a place to drop the image to be uploaded -->
        <!-- there are two custom events the component listens for:                                 -->
        <!--       the vdropzone-sending event which is fired when dropzone is sending an image     -->
        <!--       the vdropzone-success event which is fired when dropzone upload is successful    -->
        <vue-dropzone
            id="dropzone"
            class="mt-3"
            v-bind:options="dropzoneOptions"
            v-on:vdropzone-sending="addFormData"
            v-on:vdropzone-success="getSuccess"
            :useCustomDropzoneOptions="true"
        ></vue-dropzone>
        <div class="main">
            <header>
                <img id="logo" src="https://res.cloudinary.com/ashdav/image/upload/v1607439755/img/dvcdp1esn3ry9jmbffjg.png" />
                <button id="login">Login</button>
            </header>
            <section class="greeting">
                <h1>Welcome</h1>
                <button id="signup">Sign Up</button>
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
import "vue2-dropzone/dist/vue2Dropzone.min.css";

export default {
    name: "upload-photo",
    components: {
        vueDropzone: vue2Dropzone
    },
    data(){
        return {
            //-------------------------------------------------------------------------------------
            // TODO: substitute your actual Cloudinary cloud-name where indicated in the URL
            //-------------------------------------------------------------------------------------
            dropzoneOptions: {
                url: "https://api.cloudinary.com/v1_1/ashdav/image/upload",  
                thumbnailWidth: 250,
                thumbnailHeight: 250,
                maxFilesize: 2.0,
                acceptedFiles: ".jpg, .jpeg, .png, .gif",
                uploadMultiple: false,
                addRemoveLinks: true,
                dictDefaultMessage: 'Drop files here to upload. </br> Alternatively, click to select a file for upload.',                
            },      
        }
    },

    methods:{
        /******************************************************************************************
         * The addFormData method is called when vdropzone-sending event is fired
         * it adds additional headers to the request
         ******************************************************************************************/
        //--------------------------------------------------------------------------------------------
        // TODO: substitute your actual Cloudinary api-key where indicated in the following code
        // TODO: substitute your actual Cloudinary upload preset where indicated in the following code
        //----------------------------------------------------------------------------==---------------   
        addFormData(file, xhr, formData) {
            formData.append("api_key", "657265325953443");                // substitute your api key
            formData.append("upload_preset", "pfjwkuav");   // substitute your upload preset
            formData.append("timestamp", (Date.now() / 1000) | 0);
            formData.append("tags", "vue-app");
        },
         /******************************************************************************************
         * The getSuccess method is called when vdropzone-success event is fired
         ******************************************************************************************/
        getSuccess(file, response) {
            const imgUrl = response.secure_url;   // store the url for the uploaded image
            this.$emit("image-upload", imgUrl);   // fire custom event with image url in case someone cares
        },
    }
}
</script>


<style scoped>

.home {
    font-family: Arial, Helvetica, sans-serif;
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
button {
    border: none;
    border-radius: 20px;
    text-transform: uppercase;
    font-weight: bold;
    margin: 10px;
}
#login {
    background-color: white;
    font-size: 17px;
    color: #29d2db;
    padding: 3px 10px;
    margin-top: 30px;
    margin-right: 20px;
}
#signup {
    background-color: #29d2db;
    color: white;
    font-size: 20px;
    padding: 5px 15px;
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
    background-color: #29d2db;
    color: #555555;
    text-align: center;
    font-size: 12px;
    padding: 10px;
}

</style>