$(document).ready(function(){

    $('.messages').hide();

    $('.messageSender li').click(function(){
        $('#noNameClickedAlert').hide();
        var emailClicked = $(this).find('input[name="from_id"]').val();
        $('.messages').show();
        $('.messageItems').hide();
        var messagesToShow =  '#' + emailClicked;
        $(messagesToShow).show();

        // Getting the from address for the person this mail has to be sent to
        var contactEmail = $(this).find('input[name="from_email"]').val();
        $('#message_to').val(contactEmail);

    });


    $("#new_message").submit(function(e)
    {
        var postData = $(this).serializeArray();
        var formURL = $(this).attr("action");
        $.ajax(
            {
                url : formURL,
                type: "POST",
                data : postData,
                success:function(data, textStatus, jqXHR)
                {
                    console.log("Success!");
                },
                error: function(jqXHR, textStatus, errorThrown)
                {
                    console.log("Error!");
                }
            });
        e.preventDefault(); //STOP default action
    });

    $("#new_message").submit(); //Submit  the FORM
});