$(document).ready(function(){

    //var dateToCheck = '03/08/2014';




    $('#review_created_success').hide();
    $('#conversation_created_success').hide();
    $('#create_review').click(function(e){
        e.preventDefault();
        $.post('/experiences/create_review', $('form#new_review').serialize(), function(data){
            $('.modal-body').hide();
            $('#review_created_success').show();
            $('#create_review').attr('disabled', true);
            $('#create_review').addClass('disabled');
        },
            'json'
        );
    });

    $('#send_conversation').click(function(e){
        e.preventDefault();

        $.post('/conversations/create', $('form#new_conversation').serialize(), function(data){
            $('.new_conversation_body').hide();
            $('#conversation_created_success').show();
            $('#send_conversation').attr('disabled', true);
            $('#send_conversation').addClass('disabled');
        },
            'json'
        );
    });
});