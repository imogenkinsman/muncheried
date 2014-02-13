$(document).ready(function() {


$('#email-form').on('ajax:success', function(data, status, xhr) {
  alert('something');
});

$('#email-form').on('ajax:error', function(event, xhr, status) {
  alert('failure');
});

});