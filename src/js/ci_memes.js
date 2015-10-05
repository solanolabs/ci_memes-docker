var num_quotes;
var num_memes;

$(document).ready(function () {
   num_quotes = $('div.quote_wrapper').length;
   num_memes = $('div.meme_wrapper').length;
   setInterval(showNewItem, display_period);
});

function showNewItem() {
  // Should a meme or quote be displayed?
  var dice = Math.random();
  if (dice > meme_chance) {
    // Choose a new quote
    var new_quote_id = quote_id;
    while (new_quote_id == quote_id) {
      new_quote_id = Math.floor(Math.random() * num_quotes); 
    }
    // Fadeout and fadein
    $('#' + showing).fadeOut(400, function() {
      $('#quote_wrapper_' + new_quote_id).fadeIn(400);
    });
    quote_id = new_quote_id;
    showing = 'quote_wrapper_' + quote_id;
  } else {
    // Choose a new meme
    var new_meme_id = meme_id;
    while (new_meme_id == meme_id) {
      new_meme_id = Math.floor(Math.random() * num_memes); 
    }
    // Fadeout and fadein
    $('#' + showing).fadeOut(400, function() {
      $('#meme_wrapper_' + new_meme_id).fadeIn(400);
    });
    meme_id = new_meme_id;
    showing = 'meme_wrapper_' + meme_id;
  }
}

