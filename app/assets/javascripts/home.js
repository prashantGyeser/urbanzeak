$(document).ready(function(){

    $('.expListingImg').each(function(index){
        Caman(this, function(){
            this.sunrise();
            this.render();
        });

    });
    /*
    $('.expListingImg').caman(function(){
        this.sunrise();
        this.render();
    });
    */

});


