var ready;
ready = function() {

    /** Text Editor **/
//$('#message').wysihtml5();

    /** Events **/
    $('#btn-new-ticket').click( function() {
        $('#new-ticket-wrapper').slideToggle("fast","linear")
    })

    $('#btn-close-ticket').click( function() {
        $('#new-ticket-wrapper').slideToggle("fast","linear")
    });

    $('.grid .actions a.remove').on('click', function () {
        var removable = jQuery(this).parents(".grid");
        if (removable.next().hasClass('grid') || removable.prev().hasClass('grid')) {
            jQuery(this).parents(".grid").remove();
        } else {
            jQuery(this).parents(".grid").parent().remove();
        }
    });

    $('.grid .clickable').on('click', function () {
        var el = jQuery(this).parents(".grid").children(".grid-body");
        el.slideToggle(200);
    });

    $('.form-control').bind("enterKey",function(e){
        alert('k ebnter pressed');
    });

    $('.form-control').keypress(function(event){

    var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            var person_to_message = $(this).siblings('.hidden_email').val();
            var message = $(this).val();
            $.post( "messages/create", { message: message, to: person_to_message }, function(data){
                console.log('K it is getting here, need to add the message to the list of messages on top');
            });
        }

    });

};

$(document).ready(ready);
$(document).on('page:load', ready);