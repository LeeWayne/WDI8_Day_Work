
// we want to watch for the form submission, we want to attach an event on the form

// when the form is submitted we want to prevent the usual request from happening

// and then we want to make the ajax request

// when the ajax request is successful and comes back to us with the data we just need to display that data by updating the DOM elements...

// below is short hand in Jquery for document ready.
$(function(){
  $('form').on('submit', function(ev){
    ev.preventDefault();
    showLoadingMessage();
    var symbol = $('#symbol_input').val();
        // $name = $('#name');
        // $symbol = $('#symbol');
        // $lastTrade = $('#lastTrade');
        // $time = $('#time');
        // $date = $('#date');
        // $updatedAt = $('#updatedAt');
    console.log('/' + symbol);
// below is geeting the symbol from the get symbol in stocks.rb
    $.ajax({
      url: '/' + symbol,
      type: 'GET',
      success: function(response) {
        console.log(response);
        // updateElement($name, response.name);
        // updateElement($symbol, response.symbol);
        // updateElement($lastTrade, response.lastTrade);
        // updateElement($time, response.time);
        // updateElement($date, response.date);
        // updateElement($updatedAt, response.updatedAt);
        var symbols = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];
        for (var i = 0; i < symbols.length; i++) {
          updateElement($('#' + symbols[i]), response[symbols[i]]);
        }
        
        
      },
      error: function(response){
          console.log(response.status);
          // display msg to user functon here
        },
        complete: hideLoadingMessage
    });
  });

});

function updateElement($el, content) {
  $el.text(content);
  var up = true;
  var level = 15;
  var step = function () {
    var hex = level.toString(16);
    $el.css('background-color', '#FAFA' + hex + hex);
    if (up) {
      if (level > 0) {
        level--;
        setTimeout(step, 25);
      } else {
        up = false;
        level = 1;
        setTimeout(step, 25);
      }
    } else if (level < 15) {
      level += 1;
      setTimeout(step, 25);
    } else {
      $el.css('background-color', '#6666FF');
    }
  };
  setTimeout(step, 25);

}

function showLoadingMessage(){
  $('#loading').slideDown();
}

function hideLoadingMessage(){
  $('#loading').slideUp();
  }




