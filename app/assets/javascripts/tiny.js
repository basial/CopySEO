$(document).on('ready page:load', function() {
  tinymce.init({selector:'.description input'});

  $img = $(".category img");
  $img.on('mouseenter', function() {
    $(this).animate({ height:'+=50px', width:'+=50px' });
  });

  $img.on('mouseleave', function() {
    $(this).animate({ height:'-=50px', width:'-=50px' });
  });
});