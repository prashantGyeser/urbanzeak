$(document).ready(function(){

    //$('#join-notifications').hide();
    $('#available_date').hide();
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

    $('#get_dates').click(function(event){
        event.preventDefault();
        var number_of_seats = $('#attendee_seats').val();
        var experience_id = $('#experience_id').val();
        var url_to_get = "/experiences/available_dates?seats_required=" + number_of_seats + "&experience_id=" + experience_id;

        $('#join-notifications').show();


        $.get( url_to_get, function( data ) {
            $( ".result" ).html( data );
            console.log("The data returend from the server is:", data);
            var available_dates = data;
            // Removing the datepicker if is already there
            $('#attending_date').datepicker('remove');
console.log($('form#new_review').serialize());
            // Loading the date picker after the number of seats is selected.
            $('#attending_date').datepicker({
                beforeShowDay: function(date) {
                    if ($.inArray($.datepicker.formatDate('yy-mm-dd', date), available_dates) == -1) {
                        return {
                            enabled: false
                        };
                    }
                    return;

                }
            })
                .on('changeDate', function(event){
                    var date_to_write = $.datepicker.formatDate('dd-mm-yy', event.date);
                    $('#attendee_attending_date').val(date_to_write);
                })
                .on('show', function(event){
                    $('#join-notifications').hide();
                    $('#available_date').show();
                    $('#first_available_date').text(available_dates[0]);
                });

        });
    });

    $('.date_select').click(function(e){
        $(this).addClass('disabled');
    });


    $( "#attendee_seats" ).change(function(e) {

        var number_of_seats = $(this).val();

        var available_seats = $('#new_attendee input[type=radio]:checked').siblings('.text-info').children('.available_seats').text();

        $(this).css('border','');
        $('label.error').remove();

        if (number_of_seats > parseInt(available_seats))
        {
            $(this).css('border','1px solid #f35958');
            var error_message_insert = '<label for="attendee_seats" class="error" style="font-size: 12px; color: #f35958; display: block;">There are only ' + available_seats + ' seats left.</label>'
            $(error_message_insert).insertAfter($(this));
        }
        else
        {
            $(this).css('border','');
            $('label.error').remove();
        }



    });


});