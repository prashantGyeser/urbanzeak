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

    //$('.grid .clickable').off('click').on('click', function (event) {
    $('.grid .clickable').unbind('click').click(function(){
        var el = jQuery(this).parents(".grid").children(".grid-body");
        el.slideToggle(200);
    });

    $('.form-control').bind("enterKey",function(e){

    });

    $('.post-reply-button').click(function(e){
        e.preventDefault();
        var conversation_reply_to = $(this).siblings('.hidden_conversation_id').val();
        var message = $(this).siblings('.form-control').val();
        var element_selected = $(this);
        // Disabling the button after post
        if(message){

        }
        else
        {
            var divToAppendBefore = element_selected.parent().parent().parent().parent().parent();
            var failure_content = '<div class="alert alert-error"><button data-dismiss="alert" class="close"></button>Danger: You cannot send an empty message!</div>'
            var parent_container = element_selected.parent();
            $('.alert').remove();
            $(failure_content).prependTo( divToAppendBefore );
            return false;
        }
        $(this).addClass('disabled');
        $.post( "messages/create", { message: message, conversation_id: conversation_reply_to })
            .done(function(e){
            contentToAppend = '<div class="post p-b-20">' + '<h4><span class="semi-bold">You</span> said:</h4>' + '<div class="info-wrapper">' + '<div class="info">' + message + '</div>' + '<div class="clearfix"></div>' + '</div>' + '<div class="clearfix"></div>' + '</div>';
            var divToAppendBefore = element_selected.parent().parent().parent().parent().parent();

            var success_content = '<div class="alert alert-success"><button data-dismiss="alert" class="close"></button>Success: Your message was sent. Do not trust us, look above!</div>'
            $(contentToAppend).insertBefore( divToAppendBefore );
            element_selected.parent().find('textarea').val('');
            var parent_container = element_selected.parent();
            $('.alert').remove();
            $(success_content).prependTo( divToAppendBefore );
        })
            .fail( function(xhr, textStatus, errorThrown) {
                var failure_content = '<div class="alert alert-error"><button data-dismiss="alert" class="close"></button>Danger: Oops! Something went wrong, please try again later.</div>'
                var divToAppendBefore = element_selected.parent().parent().parent().parent().parent();
                var parent_container = element_selected.parent();
                $('.alert').remove();
                $(failure_content).prependTo( divToAppendBefore );
        })
            .always( function(){
                element_selected.removeClass('disabled');
            });

//        $('#send_conversation').click(function(e){
//            e.preventDefault();
//
//            $.post('/conversations/create', $('form#new_conversation').serialize())
//                .done( function(msg) {
//                    $('.new_conversation_body').hide();
//                    $('#conversation_created_success').show();
//                    $('#send_conversation').attr('disabled', true);
//                    $('#send_conversation').addClass('disabled');
//                } )
//                .fail( function(xhr, textStatus, errorThrown) {
//                    $('#conversation_created_fail').show();
//                });
//        });


    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
