$(document).ready(function(){
    $('.table input:checkbox').change(function(){
        if($(this).is(':checked'))
        {
            // Todo: Send the data to the server and check this box
            // Todo: Check if a host has already selected 3 reviews. If yes throw an error
            var review_selected = $(this).val();
            var selected_checkbox = $(this);
            $.post('/dashboard/reviews/add_review_to_show', {review_id: review_selected}, function(data){
                    var content_to_prepend = '<div class="alert alert-success">                <button data-dismiss="alert" class="close"></button> Success: The review has been added to your page</div>';
                    $('.alert-success').remove();
                    selected_checkbox.parents('.grid-body').prepend(content_to_prepend);
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
