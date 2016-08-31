(function() {
  "use strict";

  angular.module('app').controller('booksCtrl', function($scope, $http) {
    $scope.setup = function() {
      var url = "http://lx2.loc.gov:210/lcdb?version=1.1&operation=searchRetrieve&query=dc.author=asimov%20and%20dc.subject=science%20fiction&startRecord=2&maximumRecords=5&recordSchema=mods";
      // var bob = $http.get(url);
      // console.log(bob);
      $http.get(url).then(function(response) {
        var x2js = new X2JS();

        var data = x2js.xml_str2json(response.data);
        console.log(data);
        $scope.books = data;
      });
    };

    // $scope.toggleDogGroup = function(inputDog) {
    //   inputDog.groupVisible = !inputDog.groupVisible;
    // };

    // $scope.addDog = function(inputBreed, inputGroup) {
    //   var params = {
    //     breed: inputBreed,
    //     dog_group: inputGroup
    //   };

    //   // post to database then push to front-end array
    //   $http.post('/api/v1/dog_api.json', params).then(function(response) {
    //     $scope.dogs.push(response.data);
    //     $scope.errors = [];
    //     $scope.newDogBreed = '';
    //     $scope.newDogGroup = '';
    //   }, function(errorResponse) {
    //     $scope.errors = errorResponse.data.errors;
    //   });
    // };

    window.$scope = $scope;
  });
})();
