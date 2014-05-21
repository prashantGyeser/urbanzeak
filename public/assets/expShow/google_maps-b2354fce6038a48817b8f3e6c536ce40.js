$(document).ready(function() {

    var myVarsJSON = $("#map_location_latitude").html(),
        latitude     = $.parseJSON(myVarsJSON);

    //console.log(latitude);

    var myVarsJSON = $("#map_location_longitude").html(),
        longitude     = $.parseJSON(myVarsJSON);

    //console.log(longitude);

	  //Initialize Map
	  map = new GMaps({
        el: '#map',
        lat: latitude,
        lng: longitude,
        zoomControl : false,
        zoomControlOpt: {
            style : 'SMALL',
            position: 'TOP_LEFT'
        },
		 markers: [
			{lat: -12.043333, lng: -77.028333},
			{lat: -12.045333, lng: -77.034},
			{lat: -12.045633, lng: -77.022}
		],
        panControl : false,
        streetViewControl : false,
        mapTypeControl: false,
        overviewMapControl: false,
          draggable: false

      });
	  // Add a random mark
	  setTimeout( function(){
		  map.addMarker({
            lat: latitude,
            lng: longitude,
            animation: google.maps.Animation.DROP,
            draggable: false
		  });
	  },3000);
	  $("#map-zoom-out").click(function() {
		 map.zoomOut(1);
	  });

	  $("#map-zoom-in").click(function() {
		map.zoomIn(1);
	  });

});
