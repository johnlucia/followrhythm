function initRouteMap() {

  var route1

  var extractCoordinates = function(item) { return item.p; }

  // $.getJSON('/san-juans-to-mexico-route.json', function(data) {
  $.getJSON('http://localhost:3000/boats/1/positions.json', function(data) {
    route1 = data.route.reverse().map(extractCoordinates); 

    var map = new google.maps.Map(document.getElementById('route-map'), {
      zoom: 6,
      center: route1[0],
      mapTypeId: 'terrain'
    });

    var chartPlot = new google.maps.Polyline({
      path: route1,
      geodesic: true,
      strokeColor: '#024ec9',
      strokeOpacity: 1.0,
      strokeWeight: 1
    });

    var lastPositionUpdate = new google.maps.Marker({
      position: route1[0],
      map: map,
      title: 'Last Known Position'
    });

    // var contentString = "<h3>This is where Rhythm is now!</h3>"

    // var infowindow = new google.maps.InfoWindow({
    //   content: contentString
    // });

    // lastPositionUpdate.addListener('click', function() {
    //   infowindow.open(map, lastPositionUpdate);
    // });

    chartPlot.setMap(map);
  });
}
