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
    
    $('#fbFeedPost').on('ifChecked', function(event){
        $.ajax({
            url: '/dashboard/integrations/setConfig',
            type: 'POST',
            data: {"provider": "Facebook", "post": true},
            success: function(data, textStatus, jqXHR)
            {
                console.log("Ok posted", data);
                console.log("Ok posted status", textStatus);
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                console.log("There was an error", errorThrown);
            }
        });
    });
    
    $('#fbFeedPost').on('ifUnchecked', function(event){
        $.ajax({
            url: '/dashboard/integrations/setConfig',
            type: 'POST',
            data: {"provider": "Facebook", "post": false},
            success: function(data, textStatus, jqXHR)
            {
                console.log('Changed state');
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                console.log("There was an error", errorThrown);
            }
        });
    });
    
    

});