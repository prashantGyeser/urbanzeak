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

    // "myAwesomeDropzone" is the camelized version of the HTML element's ID
    Dropzone.options.newExperienceImage = {
        paramName: "experience_image[image]", // The name that will be used to transfer the file
        maxFilesize: 1 // MB
    };


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