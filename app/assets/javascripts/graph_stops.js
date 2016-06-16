$(document).on("click", "#show_bar_graph_stops", function(citymap, map){
  $('#map').hide();
  $(this).applend('<svg id="graph"></svg>')
});