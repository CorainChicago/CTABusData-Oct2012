var map;

function getBusStopData(){
  $.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: 'stops/data_stop_location_and_bus_count',
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
      showData(data, map, '#FF0000', "buses");
    },
    error: function (result) {
      console.log("error");
       error();
    }
  });
} 

function getBoardingData(){
  $.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: 'stops/average_boarding_data',
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
      showData(data, map, 'blue', "boarding_average");
    },
    error: function (result) {
      console.log("error");
       error();
    }
  });
} 

function initMap() {
  // Create the map.
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: {lat: 41.8781, lng: -87.6298},
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });
}
  
function showData(bus_stop_data, map, color, item){
  for (var stop in bus_stop_data) {
  // Add the circle for this stop to the map.
    var cityCircle = new google.maps.Circle({
      strokeColor: color,
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: color,
      fillOpacity: 0.35,
      map: map,
      center: bus_stop_data[stop].center,
      radius: Math.sqrt(bus_stop_data[stop].buses) * 50,
      radius: Math.sqrt(bus_stop_data[stop].boarding_averge) * 20
    });
  } 
}

$(document).on("click", "#show_bus_stops", function(citymap, map){
  getBusStopData();
});

$(document).on("click", "#show_boarding_data", function(citymap, map){
  getBoardingData();
});
