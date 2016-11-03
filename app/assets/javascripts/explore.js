//= require jquery
//= require jquery_ujs

function getInvaders() {
$.getJSON('invader/invaders.json', function(data) {
  console.log(data); //you'll find your json here
});
}
