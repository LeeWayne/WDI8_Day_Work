var myPlayer = myPlayer || {};


myPlayer.play = function() { 
 var mySound = myPlayer.getSound();
    
  mySound.play();
};
  myPlayer.pause = function() {
    console.debug("myPlayer.pause()");
    // Pause whatever sound is currently playing
    var sound = myPlayer.getSound();
    sound.pause();
    $('#playbutton').html('&#9654;').data('state', 'paused'); // Update symbol and state
  };

myPlayer.getSound = function() {
  if (!myPlayer._currentSound) {
    myPlayer._currentSound = soundManager.createSound({
      id: 'aSound',
      url: '/drumloop.mp3'
    });
  }
  return myPlayer._currentSound;
}

myPlayer._currentSound = null;

myPlayer.setup = function() {
  $('#playbutton').click(function(ev){
  ev.preventDefault();

  if ($('#playbutton').data('state') == 'playing'){
    myPlayer.pause();
  } else {
  $('#playbutton').data('state', 'playing');
  myPlayer.play();
  }
  });
  $('#playbutton').data('state', 'stopped');
}

soundManager.setup({
  url: '/swf',
  preferFlash: true,
  onready: myPlayer.setup
});


// *****************************

var myPlayer = myPlayer || {};


myPlayer.play = function() {
  var sound = myPlayer.getSound();
  var $playButton = $('#playbutton');
  $playButton.html('&#10074;&#10074;'); // Update play button with a pause button
  if ($playButton.data('state') == 'stopped') { // Play if stopped, otherwise resume
    sound.play();
  } else if ($playButton.data('state') == 'paused') {
    sound.resume();
  } else {
    console.warn("myPlayer is in an unexpected state: " + $playButton.data('state'));
  }
  // Keep my app state in sync
  $playButton.data('state', 'playing');
};

myPlayer.pause = function() {
  console.debug("myPlayer.pause()");
  // Pause whatever sound is currently playing
  var sound = myPlayer.getSound();
  sound.pause();
  $('#playbutton').html('&#9654;').data('state', 'paused'); // Update symbol and state
};


myPlayer.getSound = function() {
  if (!myPlayer._currentSound) {
    myPlayer._currentSound = soundManager.createSound({
      id: 'aSound',
      url: '/drumloop.mp3'
    });
  }
  return myPlayer._currentSound;

}

myPlayer._currentSound = null;


myPlayer.setup = function() {
  $('#playbutton').click(function(ev){
    ev.preventDefault();

    if ($('#playbutton').data('state') == 'playing') {
      myPlayer.pause();
    } else {
      myPlayer.play();
    }


  });
  $('#playbutton').data('state', 'stopped');
}

soundManager.setup({
  url: '/swf',
  preferFlash: true,
  onready: myPlayer.setup
});














// soundManager.setup({
//   url: '/swf/',
//   flashVersion: 9, // optional: shiny features (default = 8)
//   // optional: ignore Flash where possible, use 100% HTML5 mode
//   preferFlash: true,
//   onready: function() {
   
//     var mySound = soundManager.createSound({
//       id: 'aSound',
//       url: '/drumloop.mp3'
//     });
//     mySound.play();


//   }
// });

