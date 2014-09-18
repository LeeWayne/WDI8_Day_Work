function startLoading() {
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', true).val('Please wait...');
  $('#updatemessage').slideDown();
}

function endLoading() {
  $('#updatemessage').slideUp();
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', false).val('Query');
}

function update(el, content) {
  var $el = $(el);
  $el.text(content);
  $el.effect('highlight',1000)
}

function updatePage(data) {
  if(!$('#quote_container').is(":visible")) {
    $('#splash_container').hide();
    $('#quote_container').show();
  }

  var symbols = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];

  $.each(symbols, function(i, symbol) {
    update($('#' + symbol), data[symbol]);
  });
}


$(document).ready(function() {

  var originalContent = $('body').clone();

  $(window).on('popstate', function(event) {

    if (event.originalEvent) {
    updatePage(event.originalEvent.state);
  } else {
    $('body').relaceWith(originalContent);
  }
  });
  
  $('form').on('submit', function(ev) {
    ev.preventDefault();
    startLoading();

    var successHandler = function(data) {
      updatePage(data);

      // update history here....
      history.pushState(data, data.Symbol, '/'+data.symbol)

    };

    var symbol = $('#symbol_input').val();
    $.get('/' + symbol).success(successHandler).complete(endLoading);
  });
});






