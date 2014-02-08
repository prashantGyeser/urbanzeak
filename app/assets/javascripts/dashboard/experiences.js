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


};

$(document).ready(ready);
$(document).on('page:load', ready);