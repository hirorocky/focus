/* eslint no-console: 0 */

import Vue from "vue"

import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'
import '@simonwep/pickr/dist/themes/classic.min.css';

import EmotionRegisterForm from '../components/emotion_register_form'


new Vue({
  components: {
    EmotionRegisterForm
  }
}).$mount('#vue-top');