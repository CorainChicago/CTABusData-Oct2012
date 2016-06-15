$.ajax({
    type: "GET",
    contentType: "application/json; charset=utf-8",
    url: 'stops/data',
    dataType: 'json',
    data: "{}", 
    async: true,
    success: function (data) {
       draw(data[1], data[0]);
    },
    error: function (result) {
      console.log("error");
       error();
    }
    });

  function findBusNumber(distance, data_array){
    for (i in data_array){
      if (distance == data_array[i][1]){
        return data_array[i]
      }
    }
  }  

  function draw(data, data_array) {
      var color = d3.scale.category20b();
      var width = 1050,
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
                    return x(d) - 140;
                })
          .attr("y", barHeight / 3)
          .attr("dy", ".80em")
          .style("fill", "white")
          .text(function (d) {
                    x = findBusNumber(d, data_array)
                    return "Bus #"+ x[0] + " - " + x[1] + " stops";
                });
  }
   
  function error() {
      console.log("error")
  }

