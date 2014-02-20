$(document).ready(function(){
    $('#review_created_success').hide()
    $('#create_review').click(function(e){
        e.preventDefault();
        $.post('/experiences/create_review', $('form#new_review').serialize(), function(data){
            $('.modal-body').hide();
            $('#review_created_success').show();
        },
            'json'
        );
    });
});