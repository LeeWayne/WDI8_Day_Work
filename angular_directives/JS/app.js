(function() {  
  
  var app = angular.module('leatherLaneMarketApp', ['ngAnimate', 'ui.bootstrap', 'ngMap', 'google-maps']);  

  app.controller('MarketController', function($scope) {
    $scope.stalls = stalls;  

    $scope.mapMarkers = ["E5 0NH", "N1 1DU", "E1 6ST"]

    // $scope.map = {
    //     center: {
    //         latitude: 45,
    //         longitude: -73
    //     },
    //     zoom: 8
    // };
    
    $scope.selectStall = function(stall) {  
      $scope.selectedStall = stall;  
    }  

    $scope.clearSelectedStall = function()  {
      console.log("here")
      $scope.selectedStall = false
    }  

    $scope.addStall = function() {  
      stalls.push($scope.newStall);    
      $scope.newStall = false    
      $scope.stallForm.$setPristine();
    }  
  });  
  // 'E' is the element, A attribute
  app.directive('stallForm', function(){
    return {
      restrict: 'E', // 'A', 'M', 'C'
      templateUrl: 'shared/new_stall_form.html'
    }
  }); 

  app.directive('ninja', function(){
    return {
      restrict: 'E',
      template: "<section>Dont mess with me!</section>"
    }
  });
  // counts when hovering over an element.
  app.directive('enter', function(){
    return {
      restrict: 'A',
      link: function(scope, element){
        element.on('mouseenter', function(){
        });
      }
    }
  });

})();

var stalls = [  
  {  
    name: "Burrito",  
    price: 5,  
    description:  "Meat and vegetables in a delicious wrap"  
  },  
  {  
    name: "Pizza",  
    price: 6.5,  
    description:  "Cheese and meat and veg on some dough"  
  },  
  {
    name: "Fallafel",  
    price: 4.5,  
    description: "Deep fried delicious chickpeas"  
  }  
]  











