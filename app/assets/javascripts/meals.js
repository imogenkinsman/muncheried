$(document).ready(function() {


$('#email-form').on('ajax:success', function(data, status, xhr) {
  console.log('success');
});

$('#email-form').on('ajax:error', function(event, xhr, status) {
  console.log('failure');
});

});