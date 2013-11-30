$(document).ready(function(){
    $('#newExperienceModal').modal('show');
    $("#map").gmap3({
        map:{
            options:{
                center:[22.49156846196823, 89.75802349999992],
                zoom:2,
                mapTypeId: google.maps.MapTypeId.SATELLITE,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
                },
                navigationControl: true,
                scrollwheel: true,
                streetViewControl: true
            }
        }
    });
});