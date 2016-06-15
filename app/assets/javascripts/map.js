$.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: 'stops/data_stop_location_and_bus_count',
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
       console.log(data);
    },
    error: function (result) {
      console.log("error");
       error();
    }
    });

   var citymap = {
    chicago: {
      center: {lat: 41.878, lng: -87.629},
      population: 2714856
    },
    newyork: {
      center: {lat: 40.714, lng: -74.005},
      population: 8405837
    },
    losangeles: {
      center: {lat: 34.052, lng: -118.243},
      population: 3857799
    },
    vancouver: {
      center: {lat: 49.25, lng: -123.1},
      population: 603502
    }
    }; 

  function initMap() {
    // Create the map.
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: {lat: 41.8781, lng: -87.6298},
      mapTypeId: google.maps.MapTypeId.TERRAIN
    });

    // Construct the circle for each value in citymap.
    // Note: We scale the area of the circle based on the population.
    for (var city in citymap) {
      // Add the circle for this city to the map.
      var cityCircle = new google.maps.Circle({
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.35,
        map: map,
        center: citymap[city].center,
        radius: Math.sqrt(citymap[city].population) * 100
      });
    }
   }

   