
(function ($) {
    "use strict";


    /*==================================================================
     [ Validate ]*/
    var input = $('.validate-input .input100');
    

    $('.validate-form').on('submit', function () {
        var check = true;

        for (var i = 0; i < input.length; i++) {
            if (validate(input[i]) == false) {
                showValidate(input[i]);
                check = false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function () {
        $(this).focus(function () {
            hideValidate(this);
        });
    });

    function validate(input) {
        var password;
        if ($(input).attr('name') == 'txtPId') {
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Product ID cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^[a-z0-9_-]{3,15}+$/) == null) {
                $(input).parent().attr('data-validate', 'Product ID is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtPName') {
            password = $(input).val().trim();
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Password cannot be empty!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtDescription') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Description cannot be empty!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'linkPic') {
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Link picture number cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/\< *[img][^\>]*[src] *= *[\"\']{0,1}([^\"\'\ >]*)/) == null) {
                $(input).parent().attr('data-validate', 'Link picture is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'Price') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Price cannot be empty!');
                return false;  
            }else if ($(input).val().trim().match(/^[0-9]{2,50}+$/) == null) {
                $(input).parent().attr('data-validate', 'Price is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }



})(jQuery);

