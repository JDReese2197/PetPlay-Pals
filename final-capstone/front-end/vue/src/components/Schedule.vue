<template>
    <div class="Schedule"> <!-- One div to rule them all -->

        <div>
            <p>Line 1</p>
            <p>{{profile.firstName}}</p>
            <!--<profile :profile="profile"></profile>-->
        </div>

        <footer-bar class="footer"/>
        <div><h6><a href="https://media1.tenor.com/images/c65f4fdd955cdc6614899b0a38b8473e/tenor.gif?itemid=5648271">
        © 2020 Pet Play Pals. All Rights Reserved</a></h6>
        </div>
    </div>
</template>

<script>

import ProfilePage from '@/components/ProfilePage';
import applicationServices from '@/services/ApplicationServices';
import footerBar from '@/components/FooterBar';

export default {
    components: { 
        'profile': ProfilePage,
        footerBar
    },
    props: ['profile'],
    data() {
        return {
            petId: {
                
            }
        }
    },
    methods: {
}
}
</script>

<style scoped>

</style>