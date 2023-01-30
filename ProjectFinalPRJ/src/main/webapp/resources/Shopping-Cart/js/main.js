//* Add PayPal Email
simpleCart({
    checkout: {
        type: "PayPal",
        email: "you@yours.com"
    }
});

//* Add shopping cart dropdown in header
jQuery(document).ready(function () {
    $('.showCart').on('click', function () {
        $('#cartPopover').slideToggle('fast');
        $('.showCart span.dropdown').toggleClass('fa-chevron-circle-down fa-chevron-circle-up');
    });

});

function hihi() {
    var finalValue = "";
    var total = $('.simpleCart_total').text();
    finalValue = finalValue.concat(total,"/");
    $('.itemRow').each(function (index, element) {
        $(this).find('td').each(function () {
            if ($(this).attr('class') == 'item-name'||$(this).attr('class') == 'item-total'||$(this).attr('class') == 'item-quantity') {
                finalValue = finalValue.concat($(this).text(), ":");
            }
        });
        finalValue = finalValue.concat("/");
    });
    $('#blind').attr('value', finalValue);
}

//* Define spreadsheet URL (make sure you add the #gid=0 for the sheet you want to use)
var googleSheetURI = 'https://docs.google.com/spreadsheets/d/11BNDZeQ4nqwVA-BYViMeM1QfWBtqJT-hqKpc6hh22aM/edit#gid=0';

//* Compile the Handlebars template for HR leaders
var HRTemplate = Handlebars.compile($('#hr-template').html());

//* Load products from spreadsheet
$('#products').sheetrock({
    url: googleSheetURI,
    query: "select A,B,C,D,E",
    rowTemplate: HRTemplate
});




