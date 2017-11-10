var ready = function() {

    $(document).ready(function(){
        $(".dropdown").hover(
            function() {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
                $(this).toggleClass('open');
            },
            function() {
                $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
                $(this).toggleClass('open');
            }
        );
    });
    $('#button').click(function (event) {

        var prod_id = $('#prod_id').val()
        console.log(prod_id)
        $.ajax({
            type: "GET",
            url: "price/" + prod_id,
            dataType: "json",
            success: function (result) {
                $('#price').html(result.price.replace(/['"]+/g, ''))
            }
        });

    });
    $('#Add_to_cart').click(function (event) {

        var prod_id = $('#prod_id').val()
        var ad_to_cart_url = $('#add_to_cart_url').val()
        $.ajax({
            type: "GET",
            url: ad_to_cart_url,
            dataType: "json",
            success: function (result) {
                $('#add_to_cart_message').html(result.message)
            }
        });

    });
}

$(document).on('turbolinks:load', ready);