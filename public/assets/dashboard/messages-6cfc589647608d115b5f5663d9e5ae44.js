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
                contentToAppend = '<div class="post p-b-20">' + '<h4><span class="semi-bold">You</span> said:</h4>' + '<div class="info-wrapper">' + '<div class="info">' + message + '</div>' + '<div class="clearfix"></div>' + '</div>' + '<div class="clearfix"></div>' + '</div>';
                var divToAppendBefore = $(this).parent().parent().parent().parent().parent();


                $(contentToAppend).insertBefore( divToAppendBefore );
            });


        }

    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
