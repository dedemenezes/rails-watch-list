// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap';
window.$ = $;

import { loadDynamicBannerText } from '../components/banner';
import { initSelect2 } from '../components/init_select2';
import { showForm } from '../components/show_form';

import { initStarRating } from '../plugins/init_star_rating';
import { init_aos } from '../plugins/init_aos'

document.addEventListener('turbolinks:load', () => {
  initStarRating();
  init_aos();
  showForm();
});

document.addEventListener('turbolinks:load', () => {
  loadDynamicBannerText();
});

document.addEventListener("turbolinks:load", function() {
  initSelect2();
});

document.addEventListener('aos:in', ({ detail }) => {
  console.log('animated in', detail);
});

document.addEventListener('aos:out', ({ detail }) => {
  console.log('animated out', detail);
});