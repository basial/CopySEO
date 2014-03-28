$(document).on('ready page:load', function() {

  var title = $('#category_title');
  var desc = $('#category_description');

  set_title_stats(title);
  set_desc_stats(desc);

  title.on('keyup', function() {
    set_title_stats(title);
  });

  desc.on('keyup', function() {
    set_desc_stats(desc);
  });
});