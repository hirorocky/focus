/* eslint no-console: 0 */

import Vue from "vue"
import Vuetify from "vuetify"
// import vuetify from '../plugins/vuetify'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/dist/vuetify.min.css'

import EmotionRegisterForm from '../components/emotion_register_form'
Vue.use(Vuetify)
new Vue({
  components: {
    EmotionRegisterForm
  }
}).$mount('#vue-top');

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#vue-top',
//     components: {

//     }
//   })
// });