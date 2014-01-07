$(document).ready(function(){

    $('.messages').hide();

    $('.messageSender li').click(function(){
        $('#noNameClickedAlert').hide();
        var emailClicked = $(this).find('input[type="hidden"]').val();
        $('.messages').show();
        $('.messageItems').hide();
        console.log(emailClicked);
        var messagesToShow =  '#' + emailClicked;
        console.log(messagesToShow);
        $(messagesToShow).show();
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