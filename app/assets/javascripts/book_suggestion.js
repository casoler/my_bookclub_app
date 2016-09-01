/* global angular */ 

(function() {
  "use strict";

  angular.module("app").controller("bookSuggestionCtrl", function($scope, $http) {
    // $scope.message = "Hello world!";
    $scope.anotherMessage = "Goodbye world!";

    $scope.setVote = function(current_user_id, google_book_id, group_id) {
      var params = {
        _id: current_user_id,
        google_book_id: google_book_id
      };
      console.log('setVote', params);
      $http.post('/api/v1/book_votes.json', params).then(function(response) {
        console.log(response.data);
      });
    };
 
    window.$scope = $scope;  /* use for debugging in chrome console */
  });

})();