var ready;
ready = function() {

    $('.review_comment').hide();

    $('.view_review').click(function(e){
        e.preventDefault();
        $('.review_comment').hide();
        var divToOpen = $(this).attr('href');
        console.log("The value in the var is:", divToOpen);
        $(divToOpen).show();
    });

    $('.review_select').click(function(){
        alert('K clicked');
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);
