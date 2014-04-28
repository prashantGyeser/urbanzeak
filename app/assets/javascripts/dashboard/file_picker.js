//var ready;
//ready = function() {
//    filepicker.setKey('A3jfEp0c0TaW9SW7XnHV6z');
//    filepicker.pick(function(InkBlob){
//        console.log(InkBlob.url);
//    });
//};
//$(document).ready(ready);
//$(document).on('page:load', ready);
$(document).ready(function(){
    filepicker.setKey('A3jfEp0c0TaW9SW7XnHV6z');

    $('#file_picker').hide();

    $('#file_picker_button').click(function(e){
        e.preventDefault();
        $('#file_picker').hide();
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
});