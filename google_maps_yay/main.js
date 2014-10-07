var myMap = myMap || {} ;

myMap.initialize = function(){

  // simple map:
  var mapOptions = {
    center: { lat: 51.6, lng: -0.115 },
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP, streetViewControl:false,
    mapTypeControl: false
  };
  // main.js
  // var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  // jquery
  var mapCanvas = $('#map-canvas')[0];
  var map = new google.maps.Map(mapCanvas, mapOptions);

  // marker:

  var markerOptions = {
    position: new google.maps.LatLng(51.5, -0.109446),
    map: map
  }

  var marker = new google.maps.Marker(markerOptions);
  // marker.setMap(map);

  setTimeout(function(){
    map.setCenter(marker.getPosition())
  }, 5000);
  // map.center = marker.getPosition();

  // infowindow:
  
  var infoWindowOptions = {
    content: 'We are here!'
  };

  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

  google.maps.event.addListener(marker, 'click', function(){
    infoWindow.open(map, marker);
  });

  var autocomplete = new google.maps.places.Autocomplete($('#autocomplete')[0]);

  google.maps.event.addListener(autocomplete, 'place_changed', function(){
    infoWindow.close();

    var place = autocomplete.getPlace();

    // limiting the bounds
    // var bounds = new google.maps.LatLngBounds();
    //     bounds.extend(place.geometry.location);
    //     map.fitBounds(bounds);

    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }

    marker.setPosition(place.geometry.location);

    infoWindow.setContent('<div>'+ place.name +'</div>');

    infoWindow.open(map, marker);


  });

  $('#locate').on('click',
    function(){
    // console.log('click');

    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
    } else {
      alert("Your browser does not support geolocation");
    }

    function successCallback(position){
      // console.log(position);
      // position.coords.latitude
      var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      console.log(latlng);
      marker.setPosition(latlng);
      map.setCenter(latlng);
      map.setZoom(17);
      infoWindow.setContent('You are here!');
      infoWindow.open(map, marker);






      // var marker1 = google.maps.Marker({
      //   position: latlng,
      //   map: map,
      //   title: 'You are here!'
      // });
     
    }

    function errorCallback(error){
      console.log();
    }
   
  });

}


google.maps.event.addDomListener(window, 'load', myMap.initialize);

// navigator.geolocaiton;

// navigator.geolocaiton.
//   getCurrentLocation(
//     successCallback, errorCallback);



