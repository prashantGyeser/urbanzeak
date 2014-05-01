$(document).ready(function(){
    $('.table input:checkbox').change(function(){
        if($(this).is(':checked'))
        {
            // Todo: Send the data to the server and check this box
            // Todo: Check if a host has already selected 3 reviews. If yes throw an error
            var review_selected = $(this).val();
            $.post('/dashboard/reviews/add_review_to_show', {review_id: review_selected}, function(data){

                },
                'json'
            );
        }
        else
        {
            // Todo: Send the data to the server to remove this item from the reviews list
        }
    });
});
