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
            var conversation_reply_to = $(this).siblings('.hidden_conversation_id').val();
            var message = $(this).val();
            $.post( "messages/create", { message: message, conversation_id: conversation_reply_to }, function(data){
                console.log('Need to add this message to the list of messages on the top');
            });
        }

    });

};

$(document).ready(ready);
$(document).on('page:load', ready);