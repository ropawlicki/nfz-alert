window.addEventListener('load', function () {
  $.ajax({
    type: "PUT",
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    url: `/user_queries/${id}`,
    data: { visited_results_at: current_time }
  })
})