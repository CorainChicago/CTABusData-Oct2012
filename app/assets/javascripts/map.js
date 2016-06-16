var map;
function initMap() {
  // Create the map.
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: {lat: 41.8781, lng: -87.6298},
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });
}

function checkForGraph(){
  if ( $( "#graph_stops" ).length || $( "#map" ).length){
    $('#graph_stops').remove();
    $('.display').append('<div id= "map"> </div>');
    initMap();
  }
}

function getBusStopData(url){
  $.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: url,
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
      showData(data, map, '#FF0000');
    },
    error: function (result) {
      console.log("error");
       error();
    }
  });
}

function getBoardingData(url){
  $.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: url,
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
      showData(data, map, "blue");
    },
    error: function (result) {
      console.log("error");
    }
  });
} 

  
function showData(data, map, color){
  for (var stop in data) {
  // Add the circle for this stop to the map.
    console.log("showData")
    var cityCircle = new google.maps.Circle({
      strokeColor: color,
      strokeOpacity: 0.4,
      strokeWeight: 1,
      fillColor: color,
      fillOpacity: 0.25,
      map: map,
      center: data[stop].center,
      radius: Math.sqrt(data[stop].buses) * 20
      radius: Math.sqrt(data[stop].boarding_number) * 20,
    });
  } 
}

$(document).on("click", "#show_bus_stops", function(){
  checkForGraph();
  $("#display").append('<div id="map_stops"><h2>Map of Number of Buses Using Each Stop/h2></div>');
  getBusStopData('riderships/data_stop_location_and_bus_count');
});

$(document).on("click", "#map_boarding_data", function(){
  checkForGraph();
  $("#display").append('<div id="map_stops"><h2>Map of Bus Stops by Average Number of People Boarding </h2></div>');
  getBoardingData('riderships/boarding_average_graph');
});
