// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require ("data-confirm-modal")






// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import {initSwitchButton} from '../components/navbarsecondary.js'
import {infoConfirmModal} from '../components/infoConfirmModal.js'
import {initNotificationCable} from '../channels/notification_channel.js'
import {initTooltip} from '../components/initTooltip.js'
import {initRead} from '../components/initRead.js'
import {animateBadges} from '../components/badgesAnimation.js'
// import {notifSound} from '../components/notifSound.js'




document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initSwitchButton();
  infoConfirmModal();
  initNotificationCable();
  initTooltip();
  initRead();
  animateBadges();
  // notifSound();
});


