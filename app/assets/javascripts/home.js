jQuery(function ()
{
    jQuery("#cityFilter").autocomplete({
        source: function (request, response) {
            jQuery.getJSON(
                "http://gd.geobytes.com/AutoCompleteCity?callback=?&q="+request.term,
                function (data) {
                    response(data);
                }
            );
        },
        minLength: 3,
        select: function (event, ui) {
            var selectedObj = ui.item;
            jQuery("#cityFilter").val(selectedObj.value);
            return false;
        },
        open: function () {
            jQuery(this).removeClass("ui-corner-all").addClass("ui-corner-top");
        },
        close: function () {
            jQuery(this).removeClass("ui-corner-top").addClass("ui-corner-all");
        }
    });
    jQuery("#cityFilter").autocomplete("option", "delay", 100);
});

$(document).ready(function(){

    $('.experiencesHomePage').hide();


    $.get( "http://freegeoip.net/json/", function( data ) {
        //$( ".result" ).html( data );
        console.log("The return data is:", data.country_name);


        var urlToGet = '/experiences/get/' + data.country_name;
        $.get(urlToGet, function(experienceList){
            //console.log("The experience list is:", experienceList);
            $('#homePageSpinner').hide();
            $('.experiencesHomePage').show();

            for(var i = 0, l = experienceList.length; i<l; i++)
            {

            }

        });

    });

    $( "#cityFilter" ).autocomplete({
        select: function(event, ui) {
            console.log("The event is:", ui.item.value);
        }
    });
});