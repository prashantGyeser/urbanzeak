$(document).ready(function(){

    /*
    $(document).keypress(function(e) {
        if(e.which == 13) {
            var city = $('#filterInput').val();
            var urlToGet = "/reports/" + city;
            window.location.replace(urlToGet);
        }
    });
    */
    $('#filter').click(function(event){
        event.preventDefault();
        var city = $('#filterInput').val();
        var urlToGet = "/reports/" + city;
        window.location.replace(urlToGet);
    });


    $('#cityFilter .typeahead').typeahead({
        name: 'cities',
        //prefetch: "http://gd.geobytes.com/AutoCompleteCity?callback=?&q=" + request.term,
        remote: {
            url: "http://gd.geobytes.com/AutoCompleteCity?callback=?&q=%QUERY",
            beforeSend: function(xhr){
                //showSpinner()
                $('#cityFilter').addClass('loadinggif');
            },
            filter: function(parsedResponse){
                //hideSpinner();
                $('#cityFilter').removeClass('loading');
                return parsedResponse;
            }
        },
        limit: 10,
        minLength: 3
    });



});

$(function() {
    $('#carousel').carouFredSel({
        responsive: true,
        items: {
            visible: 1,
            width: 900,
            height: 500
        },
        scroll: {
            duration: 500,
            timeoutDuration: 5000,
            fx: 'uncover-fade'
        },
        pagination: '#pager'
    });
});

