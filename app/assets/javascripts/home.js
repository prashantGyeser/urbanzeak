$(document).ready(function(){

    $(document).keypress(function(e) {
        if(e.which == 13) {
            var city = $('#filterInput').val();
            var urlToGet = "/home/" + city;
            window.location.replace(urlToGet);
        }
    });

    $('#filter').click(function(event){
        event.preventDefault();
        var city = $('#filterInput').val();
        var urlToGet = "/home/" + city;
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



