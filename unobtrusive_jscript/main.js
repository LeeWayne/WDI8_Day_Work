// console.log("works");
// onclick="alert('clickedI');"

var myApp = myApp || {}

myApp.setUp = function(){
var button = document.getElementById('button');
button.addEventListener('click',myApp.message);
}

myApp.message = function(){
  alert('clicked');
}

window.addEventListener('load', myApp.setUp);

// above is to seperate from anyone elses button setup. personalised.

// ********************************************

// var button;
// // window.onload = setUP;
// window.addEventListener('load', setUp);
// // above coment makes sure it doesnt conflict with other libraries


// function setUp(){
// button = document.getElementById('button');
// button.addEventListener('click',message);
// }
// function message(){
//   console.log('clicked');
// }


// store the element in a var so it's a lot easier to call