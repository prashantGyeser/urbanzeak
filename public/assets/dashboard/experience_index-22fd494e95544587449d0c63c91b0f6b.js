var ready;
ready = function() {

    $('.alert-error').hide();
    $('.alert-success').hide();

    // Post to the location the user shared
    $('button.share-button-load-modal').click(function(){
        var experience_id_clicked = $(this).attr('data-button');
        //$( "div" ).data( "role" )
        $('#experience_id').val(experience_id_clicked);
        console.log('The value in the hidden field is:'+$('#experience_id').val());
    });


    $('.facebook-share').click(function(e){
        e.preventDefault();
        var experience_id_from_field = $('#experience_id').val();
        $.post('/dashboard/experiences/facebook_share', {experience_id: experience_id_from_field}, function(data){
                console.log(data);
                $('.alert-error').hide();
                $('.alert-success').show();
            })
            .fail(function(){
                console.log('Could not find a token');
                $('.alert-success').hide();
                $('.alert-error').show();
            });
    });



};

$(document).ready(ready);
$(document).on('page:load', ready);

