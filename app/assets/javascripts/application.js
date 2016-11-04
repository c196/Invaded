// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks


// Explore.js //////////////////////

function getInvaders() {
$.getJSON('/invaders.json', function(data) {
  console.log(data); //you'll find your json here
});
}


// invaders.js //////////////////////


function getLocation() {

document.getElementById('btnLocation').style.background = "#CC6452";
document.getElementById('btnLocation').value = "Search Location";
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        document.getElementById('locationField').value = "Not Supported";
    }
}

function showPosition(position) {
  var latlon = position.coords.latitude + "," + position.coords.longitude;
  var accuracy = position.coords.accuracy;  document.getElementById('locationField').value = latlon;
  document.getElementById('locationAccuracy').value = accuracy;
  document.getElementById('btnLocation').style.background = "#DAFF80";
  document.getElementById('btnLocation').value = "Done!";
}
