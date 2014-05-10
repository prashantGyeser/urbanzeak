var ready;
ready = function() {
    //$('.grid .clickable').off('click').on('click', function (event) {
    $('.grid .clickable').unbind('click').click(function(){
        var el = jQuery(this).parents(".grid").children(".grid-body");
        el.slideToggle(200);
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);