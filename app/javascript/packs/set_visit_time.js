function hola() {
  console_log("HOLA!")
}

window.addEventListener('turbolinks:load', hola);
window.removeEventListener('turbolinks:before_cache', hola)



/*window.addEventListener ('load', function (){
  
  $.ajax({
    type: "POST",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url: "visit_update/" + id
  })
})*/