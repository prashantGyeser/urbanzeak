$(document).ready(function(){
    $('.table input:checkbox').change(function(){
        if($(this).is(':checked'))
        {
            // Todo: Send the data to the server and check this box
            // Todo: Check if a host has already selected 3 reviews. If yes throw an error
            $.post('/dashboard/reviews/add_review_to_show', {experience_id: 77, review_id: 33}, function(data){
                    alert('data posted');
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