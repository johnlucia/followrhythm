function initRouteMap() {

  var route1

  var extractCoordinates = function(item) { return item.p; }

  $.getJSON('https://voyagetracker.herokuapp.com/boats/1/positions.json', function(data) {
  // $.getJSON('http://localhost:3001/boats/1/positions.json', function(data) {
    route1 = data.route.map(extractCoordinates); 

    var map = new google.maps.Map(document.getElementById('route-map'), {
      zoom: 6,
      center: route1[0],
      mapTypeId: 'terrain',
      scaleControl: true
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
      title: 'Latitude: ' + route1[0].lat + ', Longitude: ' + route1[0].lng + ' ...Click for more info'
    });

    var date = data.meta.last_update;
    var currentLat = data.meta.latitude;
    var currentLon = data.meta.longitude;
    var currentSpeed = data.meta.speed_in_knots;
    var currentHeading = data.meta.heading;

    var contentString = '<table class="table"><tbody>' +
                        '<tr><td>Time:</td><td>' + date + '</td></tr>' +
                        '<tr><td>Speed:</td><td>' + currentSpeed + ' knots</td></tr>' +
                        '<tr><td>Heading:</td><td>' + currentHeading + ' Deg.</td></tr>' +
                        '<tr><td>Latitude:</td><td>' + currentLat + '</td></tr>' +
                        '<tr><td>Longitude:</td><td>' + currentLon + ' </td></tr>' +
                        '</tbody></table>'

    $('#position-report-details').html(contentString);

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    lastPositionUpdate.addListener('click', function() {
      infowindow.open(map, lastPositionUpdate);
    });

    chartPlot.setMap(map);
  });
}
