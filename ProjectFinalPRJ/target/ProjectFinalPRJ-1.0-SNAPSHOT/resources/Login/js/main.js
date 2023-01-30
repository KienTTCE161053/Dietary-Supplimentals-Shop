
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
        if ($(input).attr('type') == 'text' || $(input).attr('name') == 'txtUsername') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Username cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^(?=.{4,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+$/) == null) {
                $(input).parent().attr('data-validate', 'Username is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('type') == 'password' || $(input).attr('name') == 'txtPassword') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Password cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/) == null) {
                $(input).parent().attr('data-validate', 'Password is not valid!');
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