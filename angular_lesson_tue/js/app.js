
(function() {

  var app = angular.module('leatherLaneMarketApp', ['ngAnimate']);


  var stalls = [{
    name: 'Burrito',
    price: 5,
    description: "Meat and veg wrapped in a delicious wheat free tortilla"
  },
  {
    name: 'Pizza',
    price: 5.5,
    description: "Seriously? pound 50p for bread and tomatoe?!"
  },
  {
    name: 'Burger',
    price: 6,
    description: "Yummy Burgers"
  }


  ];

  app.controller('MarketController', function($scope) {
   
    $scope.stalls = stalls;

    // $scope.selectedStall = stalls[1];

    $scope.selectStall = function(stall) {
      $scope.selectedStall = stall;
    };
    $scope.clearSelectedStall = function() {
      $scope.selectedStall = false;
    };


    $scope.addStall = function() {
      $scope.stalls.push($scope.newStall);
      $scope.newStall = false;
      $scope.stallForm.$setPristine();
    };


    // $scope.basket = 0;

    // $scope.addToBasket = function() {
    //   $scope.basket ++;
    // }




  });


})();



