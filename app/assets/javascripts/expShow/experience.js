$(document).ready(function(){

    $('#join-notifications').hide();

    // SINGLE PAGE NAV START
    $('#top-nav').singlePageNav();
    // SINGLE PAGE NAV END

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

    $( "#attendee_seats" ).change(function(e) {

        var number_of_seats = $(this).val();
        var experience_id = $('#experience_id').val();
        var url_to_get = "/experiences/available_dates?seats_required=" + number_of_seats + "&experience_id=" + experience_id;

        $('#join-notifications').show();

        $.get( url_to_get, function( data ) {
            $( ".result" ).html( data );
            console.log("The data returend from the server is:", data);
            var available_dates = data;
            // Removing the datepicker if is already there
            $('#attendee_attending_date').datepicker('remove');

            // Loading the date picker after the number of seats is selected.
            $('#attendee_attending_date').datepicker({
                beforeShowDay: function(date) {
                    if ($.inArray($.datepicker.formatDate('yy-mm-dd', date), available_dates) == -1) {
                        return {
                            enabled: false
                        };
                    }
                    return;

                }
            });

        });
    });

    //var datesEnabled = <%= raw @dates_array %>;

});