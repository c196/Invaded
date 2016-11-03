//= require jquery
//= require jquery_ujs

function getLocation() {

document.getElementById('btnLocation').style.background = "#CC6452";
document.getElementById('btnLocation').value = "Getting Location...";
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
    console.log("Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude + "<br> Accuracy:" + position.coords.accuracy);
}
