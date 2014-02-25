var ready;
ready = function() {

    $('tr').click(function(){
        var messageIdSelected = $(this).data('message-id');
        window.location = "/dashboard/messages/" + messageIdSelected;
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);