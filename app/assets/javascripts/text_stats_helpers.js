function text_stats(input) {
  var words = input.trim().replace(/ +/g," ").split(" ");
  var chars = input.replace(/ /g,'').split("");
  var sentences = input.split(".");

  if (words == "") {
    var words_count = 0;
    var spaces_count = 0;
  } else {
    var words_count = words.length;
    var spaces_count = words_count-1;
  }
  
  var chars_count = chars.length;
  var sentences_count = sentences.length-1;

  var stats = [words_count, spaces_count, chars_count, sentences_count];
  return stats;
}

function set_title_stats(title) {
  var title_word_stats = $('#title_words');
  var title_char_stats = $('#title_chars');
  var title_spaces_stats = $('#title_spaces');
  var warnings = $('.warnings')

  var title_stats = text_stats(title.val());

  title_word_stats.html(title_stats[0]);
  title_spaces_stats.html(title_stats[1]);
  title_char_stats.html(title_stats[2]);

  if (title_stats[0] < 1) {
    warnings.html('<p> Tytuł nie może pozostać pusty. </p>');
    warnings.addClass('alert alert-danger');
  } else {
    warnings.html('Możesz dodać zmiany!');
    warnings.removeClass('alert alert-danger');
    warnings.addClass('alert alert-success');
  }
}

function set_desc_stats(text) {
  var desc_word_stats = $('#description_words')
  var desc_char_stats = $('#description_chars')
  var desc_spaces_stats = $('#description_spaces')
  var desc_sentences_stats = $('#description_sentences')
  
  var cleaned_text = text.replace(/(<([^>]+)>)/ig,"").replace(/&nbsp;/g,"").replace(/ +/g," ");
  var desc_stats = text_stats(cleaned_text);

  desc_word_stats.html(desc_stats[0]);
  desc_spaces_stats.html(desc_stats[1]);
  desc_char_stats.html(desc_stats[2]);
  desc_sentences_stats.html(desc_stats[3]);
}