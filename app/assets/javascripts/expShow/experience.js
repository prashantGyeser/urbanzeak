$(document).ready(function(){
    $('#review_created_success').hide()
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
            $('.modal-body').hide();
            $('#review_created_success').show();
            $('#create_review').attr('disabled', true);
            $('#create_review').addClass('disabled');
        },
            'json'
        );
    });
});