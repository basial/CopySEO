$(document).on('page:load ready', function() {
  var img = $("table img");
  img.on('mouseenter', function() {
    $(this).animate({ height:'+=30px', width:'+=50px' });
  });

  img.on('mouseleave', function() {
    $(this).animate({ height:'-=30px', width:'-=50px' });
  });
});