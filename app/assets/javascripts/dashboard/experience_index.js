var ready;
ready = function() {

    $('.alert-error').hide();
    $('.alert-success').hide();
    $('.posting-to-fb-notification').hide();

    // Post to the location the user shared
    $('button.share-button-load-modal').click(function(){
        var experience_id_clicked = $(this).attr('data-button');
        var experience_url = $(this).attr('data-url');
        var experience_name = $(this).attr('data-name');

        // Adding a message to show the user what will be posted to their network
//        Come join us for a great experience: <%# experience.name %> by going to http://<%= @current_user.subdomain %>.urbanzeak.com/<%# experience.slug %>
        var message_that_will_be_posted = 'Come join us for a great experience:' + experience_name + 'by going to ' + experience_url;
        $('#share-message').text(message_that_will_be_posted);


        //$( "div" ).data( "role" )
        $('#experience_id').val(experience_id_clicked);
        console.log('The value in the hidden field is:'+$('#experience_id').val());
    });


    $('.facebook-share').click(function(e){
        e.preventDefault();
        $('.posting-to-fb-notification').show();
        var experience_id_from_field = $('#experience_id').val();
        $.post('/dashboard/experiences/facebook_share', {experience_id: experience_id_from_field}, function(data){
                console.log(data);
                $('.alert-error').hide();
                $('.alert-success').show();
                $('.posting-to-fb-notification').hide();
            })
            .fail(function(){
                console.log('Could not find a token');
                $('.alert-success').hide();
                $('.alert-error').show();
                $('.posting-to-fb-notification').hide();
            });
    });



};

$(document).ready(ready);
$(document).on('page:load', ready);

