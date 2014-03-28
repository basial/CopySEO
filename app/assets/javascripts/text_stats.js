$(document).on('ready page:load', function() {
  $("#category_description").first().each(function(){

    var title = $('#category_title');
    var desc = $('#category_description');

    set_title_stats(title);
    set_desc_stats(desc.val());

    title.on('keyup', function() {
      set_title_stats(title);
    });

    initTinyMce();
  });
  // $('#tinymce').on('keyup', function() {
  //   set_desc_stats(desc);
  // });
});