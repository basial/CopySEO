initTinyMce = function() {
  var ed = new tinymce.Editor(
    'category_description', 
    {},
    tinymce.EditorManager);

  ed.init();
  ed.on("keyup", function(){
    set_desc_stats(ed.getContent());
    ed.save();
  });
};
