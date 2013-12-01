$(document).ready(function(){
    $('#newExperienceModal').modal('show');
    function placeMarker(location) {
        var marker = new google.maps.Marker({
            position: location,
            map: map,
        });
        var infowindow = new google.maps.InfoWindow({
            content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
        });
        infowindow.open(map,marker);
    }
    $("#map").gmap3({
        map:{
            options:{
                center:[22.49156846196823, 89.75802349999992],
                zoom:10,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
                },
                navigationControl: true,
                scrollwheel: true,
                streetViewControl: true
            },
            events:{
                click: function(event, data){
                    // Getting the latitude and longitude for the location clicked on the map
                    console.log("The event is:", data.latLng);
                    $(this).gmap3({
                        marker: {
                            latLng: data.latLng
                        }
                    });
                }
            },

        }
    });
});

$(window).load(function() {
    $('#slider').nivoSlider();
});