$(document).ready(function() {
  $('.cancel-link').on('click', function(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    var link = $(this).href;
    console.log(link);

    $.ajax({
      url: link,
      type: 'DELETE',
      success: function(result) {
        self.closest('.item-caption').load(document.URL + '.item-caption');
      }
    });
  });
});
