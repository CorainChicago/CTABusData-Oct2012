var citymap;
var map;

$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: 'stops/data_stop_location_and_bus_count',
  dataType: 'json',
  data: "{}", 
  async: true,
  success: function (data) {
    citymap = data;
    console.log(data);
    console.log(citymap)
  },
  error: function (result) {
    console.log("error");
     error();
  }
  }); 

function initMap() {
  // Create the map.
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: {lat: 41.8781, lng: -87.6298},
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });

  // Construct the circle for each value in citymap.
  // Note: We scale the area of the circle based on the population.
  // for (var city in data) {
  //   // Add the circle for this city to the map.
  //   var cityCircle = new google.maps.Circle({
  //     strokeColor: '#FF0000',
  //     strokeOpacity: 0.8,
  //     strokeWeight: 2,
  //     fillColor: '#FF0000',
  //     fillOpacity: 0.35,
  //     map: map,
  //     center: citymap[city].center,
  //     radius: Math.sqrt(citymap[city].buses) * 50
  //   });
  }
  function showBusStops(citymap, map){
    for (var city in citymap) {
      console.log(citymap[city]);
    // Add the circle for this city to the map.
    var cityCircle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      center: citymap[city].center,
      radius: Math.sqrt(citymap[city].buses) * 50
    });
  }



$(document).on("click", "#show_bus_stops", function(citymap, map){
   showBusStops(citymap, map);
});
