var ready;
ready = function() {
  $('.cancel-link').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var self = this;

    $.ajax( self.href, {
      method: $(self).attr('data-method'),
      success: function(result) {
        var itemCaption = $(self).closest('.item-caption');
        itemCaption.load('/ #'+$(self).closest('.item-caption').attr('id'));
      }
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
