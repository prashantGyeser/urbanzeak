$(document).ready(function(){
    //$('#newExperienceModal').modal('show');
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
                    //var latitude = $("#map").gmap3(marker.value);
                    $('#experience_latitude').val(data.latLng.lat());
                    $('#experience_longitude').val(data.latLng.lng());
                    $(this).gmap3({
                        clear: "marker",
                        marker: {
                            latLng: data.latLng
                        }
                    });
                }
            }

        }
    });


});

$(window).load(function() {
    $('#slider').nivoSlider();
});

