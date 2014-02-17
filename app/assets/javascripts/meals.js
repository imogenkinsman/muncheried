$(function() {


$('#email-form').on('ajax:success', function(data, status, xhr) {
  $('#flash-messages').remove();
  $('nav').after("<p>Success</p>");
});

$('#email-form').on('ajax:error', function(event, xhr, status) {
  // idk handle this better
});

$('#help-popover').popover();

});