var ready;
ready = function() {

    /** Text Editor **/
//$('#message').wysihtml5();

    /** Events **/
    $('#btn-new-ticket').click( function() {
        $('#new-ticket-wrapper').slideToggle("fast","linear")
    });

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

    $('.form-control').bind("enterKey",function(e){

    });

    $('.post-reply-button').click(function(e){
        e.preventDefault();
        var conversation_reply_to = $(this).siblings('.hidden_conversation_id').val();
        var message = $(this).siblings('.form-control').val();
        var element_selected = $(this);
//        contentToAppend = '<div class="post p-b-20">' + '<h4><span class="semi-bold">You</span> said:</h4>' + '<div class="info-wrapper">' + '<div class="info">' + message + '</div>' + '<div class="clearfix"></div>' + '</div>' + '<div class="clearfix"></div>' + '</div>';
//        var divToAppendBefore = $(this).parent().parent().parent().parent().parent();
//
//
//        $(contentToAppend).insertBefore( divToAppendBefore );


        $.post( "messages/create", { message: message, conversation_id: conversation_reply_to }, function(data){
            contentToAppend = '<div class="post p-b-20">' + '<h4><span class="semi-bold">You</span> said:</h4>' + '<div class="info-wrapper">' + '<div class="info">' + message + '</div>' + '<div class="clearfix"></div>' + '</div>' + '<div class="clearfix"></div>' + '</div>';
            var divToAppendBefore = element_selected.parent().parent().parent().parent().parent();

            $(contentToAppend).insertBefore( divToAppendBefore );

        });
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
