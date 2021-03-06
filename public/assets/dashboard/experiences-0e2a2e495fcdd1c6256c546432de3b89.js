var ready;
ready = function() {

  // Auto saving the form using sisyphus
  $('#new_experience').sisyphus();

  //Time pickers
  $('.timepicker-default').timepicker();
  $('.timepicker-24').timepicker({
    minuteStep: 1,
    showSeconds: true,
    showMeridian: false
  });

  $('#clock-button').click(function(){
    $('#experience_exp_time').focus();
  });

  // Landmark auto complete
  $('#experience_land_mark').geocomplete({
    map: "#map",
    markerOptions: {
      draggable: true
    },
    blur: true
  });

  $("#experience_land_mark").trigger("geocode");

  //Strivers' Row, New York, NY, United States
  function trigger_geocode(){
    console.log("The geocoding has begun");
    $("#experience_land_mark").trigger("geocode");
  }

//  $('#experience_land_mark').blur(function() {
//    console.log();
//    var landmark_entered = $(this).val();
//    if(landmark_entered !== "")
//    {
//      $("#experience_land_mark").trigger("geocode");
//    }
//  });

  $('#experience_land_mark').bind("geocode:result", function(event, result){
    console.log(result);
    $("#experience_latitude").val(result.geometry.location.lat());
    $("#experience_longitude").val(result.geometry.location.lng());
  });

  $("#experience_land_mark").bind("geocode:dragged", function(event, latLng){
    $("#experience_latitude").val(latLng.lat());
    $("#experience_longitude").val(latLng.lng());
    $("#reset").show();
  });

  $('.edit_experience').submit(function(){
    var landmark_entered = $('#experience_land_mark').val();
    if(landmark_entered !== "")
    {
      $("#experience_land_mark").trigger("geocode");
    }
    return true
  });


  // File picker code -- end

};

$(document).ready(ready);
$(document).on('page:load', ready);
