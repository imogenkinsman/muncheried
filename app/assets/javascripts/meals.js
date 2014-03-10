$(function() {


$('#email-form').on('ajax:success', function(data, status, xhr) {
  createFlash(status.type, status.message);
});

$('#email-form').on('ajax:error', function(event, xhr, status) {
  createFlash('error', 'There was an error submitting your email address. Please try again.');
});

var createFlash = function(type, message) {
  $('#flash-messages').remove();
  // TODO: pass a partial from the json response or something, this is hacky
  $('nav').after("<div id='flash-messages'><ul><li class='" + type + "'>" + message + "</li></ul></div>");
  $('#flash-messages').slideDown();
}

});