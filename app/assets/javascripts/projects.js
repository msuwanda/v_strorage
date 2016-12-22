
var ready;
ready = (function() {
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  $("#hashtaginput").autocomplete({
    source: '/projects/autocomplete.json',
  });
});

$(document).ready(ready);
$(document).on('page:load', ready);


var ready;
ready = (function() {
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  $("#user_id").autocomplete({
    source: '/projects/autocomplete_user',
  });
});

$(document).ready(ready);
$(document).on('page:load', ready);

$(function() {
    $('[data-validate]').blur(function() {
        $this = $(this);
        $.get($this.data('validate'), {
            name: $this.val()
        }).success(function() {
            $("#validate-groups").addClass('hidden-div');
        }).error(function() {
            $("#validate-groups").removeClass('hidden-div');
        });
    });
});