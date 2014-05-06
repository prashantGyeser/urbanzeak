var ready;
ready = function() {

    $('.avatar-uploader').hide();

    $('#delete-profile-picture').click(function(e){
        e.preventDefault();
        var host_id = $('');

        $.post( "delete-picture", { host_id: 6 }, function(data){
            $('#profile-picture').hide();
            $('#delete-profile-picture').hide();
            $('.avatar-uploader').show();
        });

    })
};

$(document).ready(ready);
$(document).on('page:load', ready);
