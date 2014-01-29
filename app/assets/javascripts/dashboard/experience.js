$(document).ready(function(){
    
    $('#special_instructions').hide();

    $('#add_special_instructions').click(function(e){
        e.preventDefault();
        $('.additionaActions').hide();

        $('#special_instructions').show();

    });

    
    /*
    $('#new_experience_image').fileupload({
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
        }
    });
*/
    /*
    $(function(){
        $('select').selectric();
    });
    */
    //$('#schedule_calendar').multiDatesPicker();

    $(function() {
        $( "#schedule_calendar" ).multiDatesPicker({
            dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>'
        });
      });
 
    $('#timepicker').timepicker();

    // Change this to the location of your server-side upload handler:
    
    var url = '/images/create_header';

    $('#new_experience_image').fileupload({
        url: url,
        dataType: 'json',
        done: function (e, data) {
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
    

    $('#new_experience').submit(function(){
        var dates = $('#schedule_calendar').multiDatesPicker('getDates');    
        console.log("the dates are:", date);
    })

    

})
