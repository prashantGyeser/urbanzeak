$(document).ready(function(){
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        increaseArea: '40%'
    });

    $(document).ready(function(){
        $('#postMessageToFB').click(function(){
            var message = {message: $('#messageToPostToFB').val()};
            $.ajax({
                url: '/dashboard/integrations/postToFacebook',
                type: 'POST',
                data: message,
                success: function(data, textStatus, jqXHR)
                {
                    console.log("Ok posted");
                },
                error: function(jqXHR, textStatus, errorThrown)
                {
                    console.log("There was an error", errorThrown);
                }
            });

        });
    });

});