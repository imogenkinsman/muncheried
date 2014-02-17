$(function() {


$('#email-form').on('ajax:success', function(data, status, xhr) {
  $('#flash-messages').remove();
  // TODO: pass a partial from the json response or something, this is hacky
  $('nav').after("<div id='flash-messages'><ul><li class='" + status.type + "'>" + status.message + "</li></ul></div>");
  $('#flash-messages').slideDown();
});

$('#email-form').on('ajax:error', function(event, xhr, status) {
  // idk handle this better
});

$('#help-popover').popover();

});