$(document).ready(function(){

    $('.messages').hide();

    $('.messageSender li').click(function(){
        $('#noNameClickedAlert').hide();
        var emailClicked = $(this).find('input[name="from_id"]').val();
        $('#currentListItem').val(emailClicked);
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
        //var locationToAddTo = $(this)


        $.ajax(
            {
                url : formURL,
                type: "POST",
                data : postData,
                success:function(data, textStatus, jqXHR)
                {
                    console.log("Success!");
                    console.log(data);
                    var locationToAddTo = '#' + $('#currentListItem').val();
                    //content
                    var contentToAppend = '<li><div class="sender"><strong>You</strong></div>' + data.body + '</li>';
                    $(locationToAddTo).find('ul').append(contentToAppend);

                    $('#message_body').val('');
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