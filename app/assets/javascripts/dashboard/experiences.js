var ready;
ready = function() {

    //Date Pickers
    $('.input-append.date').datepicker({
        autoclose: true,
        todayHighlight: true
    });

    //Time pickers
    $('.timepicker-default').timepicker();
    $('.timepicker-24').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    });

    $(function() {
        var mediaDropzone;
        mediaDropzone = new Dropzone("#new_experience_image");
        return mediaDropzone.on("success", function(file, responseText) {
            console.log("The file from the server is:", file);
            console.log("The response from the server is:", responseText);
            var imageUrl;
            imageUrl = responseText.file_name.url;
            console.log("The url is:", imageUrl);
        });
    });



};

$(document).ready(ready);
$(document).on('page:load', ready);