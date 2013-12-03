$(document).ready(function(){

    /*
    $('.expListingImg').each(function(index){
        Caman(this, function(){
            this.sunrise();
            this.render();
        });

    });
    */
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

});


