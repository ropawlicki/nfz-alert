$(document).on('turbolinks:load', function () {
    $('#submit_spinner').hide();
    $("form").submit( function() {
      $('#submit_spinner').show()
    })
  })

/*
$(document).ready(function() {
  $('#submit_spinner').hide()
});

$(document).ready(function() {
  $("form").submit( function() {
    $('#submit_spinner').show()
  })
});
*/