
function createGraph(url, type){
  $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: url,
      dataType: 'json',
      data: "{}", 
      async: true,
      success: function (data) {
        draw(data[1], data[0], type);
      },
      error: function (result) {
        error();
      }
    });
}

  function findBusNumber(distance, data_array){
    for (i in data_array){

      if (distance == data_array[i][1] && data_array[i][1] !== null){
        return data_array[i]
      }
    }
  }  

  function draw(data, data_array, type) {
      var color = d3.scale.category20b();
      var width = 1150,
          barHeight = 35;
   
      var x = d3.scale.linear()
          .range([0, width])
          .domain([0, d3.max(data)]);
   
      var chart = d3.select("#graph")
          .attr("width", width)
          .attr("height", barHeight * data.length);
   
      var bar = chart.selectAll("g")
          .data(data)
          .enter().append("g")
          .attr("transform", function (d, i) {
                    return "translate(0," + i * barHeight + ")";
                });
   
      bar.append("rect")
          .attr("width", x)
          .attr("height", barHeight - 1)
          .style("fill", function (d) {
                     return color(d)
                 })
   
      bar.append("text")
          .attr("x", function (d) {
                    return x(d) - 430;
                })
          .attr("y", barHeight / 3)
          .attr("dy", ".65em")
          .style("fill", "white")
          .text(function (d) {
                    x = findBusNumber(d, data_array)
                    if(x.length == 2){
                    return type +" #"+ x[0] + " - " + x[1];
                  }
                });
  }
  function error() {
      console.log("error")
  }

$(document).on("click", "#stops_by_amount_of_buses", function(){
  $('#map').remove();
  $('#graph_stops').remove();
  $("div").append('<div id="graph_stops"><h2>Graph of Stops by Bus Count</h2><svg id="graph"></svg><div>');
  createGraph('riderships/stops_by_amount_of_buses', "At");
});


$(document).on("click", "#graph_buses_by_stops", function(citymap, map){
  $('#map').remove();
  $('#graph_stops').remove();
  $("div").append('<div id="graph_stops"><h2>Graph of Buses by Number of Stops</h2><svg id="graph"></svg><div>');
  createGraph('riderships/buses_by_stops', "Bus");
});
