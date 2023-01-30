
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
        if ($(input).attr('name') == 'txtUsername') {
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Username cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^(?=.{4,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+$/) == null) {
                $(input).parent().attr('data-validate', 'Username is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtPassword') {
            password = $(input).val().trim();
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Password cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/) == null) {
                $(input).parent().attr('data-validate', 'Password must be at least 8 characters include at least one digit,one lower case, one upper case!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtConfirmPassword') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Confirm Password cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/) == null) {
                $(input).parent().attr('data-validate', 'Confirm Password must be at least 8 characters include at least one digit,one lower case, one upper case!');
                return false;
            } else if ($(input).val().trim().match(password) == null) {
                $(input).parent().attr('data-validate', 'Confirm Password is not correct!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtPhoneNumber') {
            if ($(input).val().trim() == '') {
                $(input).parent().attr('data-validate', 'Phone number cannot be empty!');
                return false;
            } else if ($(input).val().trim().match(/^((\(0[1-9]\d{0,2}\)|0[1-9]\d{0,2}[\.\-]?)\d{7}|0[1-9]\d{8,9})$/) == null) {
                $(input).parent().attr('data-validate', 'Phone number is not valid!');
                return false;
            } else {
                $(input).parent().attr('data-validate', '');
            }
        }
        if ($(input).attr('name') == 'txtAddress') {
            if ($(input).val().trim() === '') {
                $(input).parent().attr('data-validate', 'Address cannot be empty!');
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