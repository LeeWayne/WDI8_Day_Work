var myPlayer = myPlayer || {};
myPlayer.play = function(el) {
  var sound = myPlayer.getSound(el.attr('id'));
  soundManager.play(el.attr('id'),{
    onplay: function() {
      console.log($(el));
      $(el).addClass('playing');
    },
    onfinish: function() {
      console.log($(el));
      $(el).removeClass('playing');
    }
  });
};

myPlayer.getSound = function(sound) {
  var sound = soundManager.createSound({
    id: sound,
    url: '/wavs/' + sound + '.wav'
  });
  return sound;
};

myPlayer.setup = function() {
  $('.playbutton').click(function(ev) { myPlayer.play($(this)); });
};

$(document).ready(function() {
  soundManager.setup({ url: '/swf/', preferFlash: true, onready: myPlayer.setup });
});
