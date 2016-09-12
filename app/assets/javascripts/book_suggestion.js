/* global angular */ 

(function() {
  "use strict";

  angular.module("app").controller("bookSuggestionCtrl", function($scope, $http) {
    // $scope.message = "Hello world!";
    $scope.anotherMessage = "Goodbye world!";

    $scope.setVote = function(member_id, group_id, isbn) {
      var params = {
        member_id: member_id,
        group_id: group_id,
        isbn: isbn
      };
      $http.post('/api/v1/book_votes.json', params).then(function(response) {
        console.log('hello again');
      });
    };

    $scope.showDescription = function(book){
      console.log($scope.showBookDescription);
      $scope.showBookDescription = !$scope.showBookDescription;
    };
 
    window.$scope = $scope;  /* use for debugging in chrome console */
  });

})();