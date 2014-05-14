var ready;
ready = function() {

    $('.avatar-uploader').hide();

    $('#delete-profile-picture').click(function(e){
        e.preventDefault();
        var host_id = $('#delete-profile-picture').attr('data-host-id');

        $.post( "delete-picture", { host_id: host_id }, function(data){
            $('#profile-picture').hide();
            $('#delete-profile-picture').hide();
            $('.avatar-uploader').show();
        });

    })
};

$(document).ready(ready);
$(document).on('page:load', ready);
