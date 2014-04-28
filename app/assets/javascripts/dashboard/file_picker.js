var ready;
ready = function() {

    $('#file_picker').hide();

    $('#file_picker_button').click(function(e){
        e.preventDefault();
        $('#file_picker').hide();
        filepicker.setKey('A3jfEp0c0TaW9SW7XnHV6z');
        filepicker.pickMultiple({
                mimetypes: 'image/*',
                container: 'modal',
                services:'COMPUTER'
            },
            function(InkBlobs){
                var strigifiedInkBlobs = JSON.stringify(InkBlobs);
                console.log(strigifiedInkBlobs);
                $('#experience_image_image').val(strigifiedInkBlobs);
            },
            function(FPError){
                console.log(FPError.toString());
            }
        );
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);
