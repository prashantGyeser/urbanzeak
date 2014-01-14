$(document).ready(function(){
    
    // Adding a contenteditable tag to all the divs that need to be editable.
    // Todo: Still need to add code so that the images can be edited
    $('header, .title-two, .half-content, .p-title-one, .p-title-two').attr('contenteditable', 'true');
    
    
    $('header, .title-two, .half-content, .p-title-one, .p-title-two').hover(
        function() {
            $( this ).addClass( 'editableHover' );
        }, function() {
            $( this ).removeClass('editableHover');
        }    
    );
    
    // Adding a button on top of the images so that they can be edited and additional images can be added or the current ones can be modified.
    $('.imageUpload').hover(function(){
        
        //$(this).addClass('imageOverlay');
        var position = $(".caroussel").offset();
        $(".imageOverlay").css( { position: "absolute", left: position.left, top: position.top } );
    })
    
    
});

