var ready;
ready = function() {

    $('#file_picker').hide();
    $('#file-upload-success-message').hide();
    $('#delete-all-files-container').hide();

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
                $('#images').val(strigifiedInkBlobs);
                $('#file-upload-success-message').show();
                $('#files_uploaded_list tr').remove();
                $('#select_file_container').hide();
                $('#delete-all-files-container').show();
                $.each(InkBlobs, function( index, value ) {
                    var row_to_add = '<tr style="border-top:5px solid #fff"><td><img src="' + value.url + '" class="img-responsive"/> </td></tr>';
                    $('#files_uploaded_list').append(row_to_add);
                });
            },
            function(FPError){
                console.log(FPError.toString());
            }
        );
    });

    var images_exist = $('#experience_exist').val();
    if (images_exist == 0) {
        $('#select_file_container').hide();
        $('#delete-all-files-container').show();
    }
    else {
        $('#select_file_container').show();
        $('#delete-all-files-container').hide();
    }

    $(function(){
        $('#delete-all-files-container').on('click','button', function(e){
            e.preventDefault();
            $('#images').val("");
            $('#files_uploaded_list tr').remove();
            $('#select_file_container').show();
            $('#delete-all-files-container').hide();
        })
    });



};
$(document).ready(ready);
$(document).on('page:load', ready);
