/* global angular */ 

(function() {
  "use strict";

  angular.module("app").controller("bookVoteCtrl", function($scope, $http) {
    $scope.setup = function() {
      console.log('hello');
      $http.get('/api/v1/book_votes.json').then(function(response) {
        console.log(response.data);
        $scope.book_votes = response.data;
      });
    };
    // $scope.setVote = function(member_id, group_id, google_book_id) {
    //   var params = {
    //     member_id: member_id,
    //     group_id: group_id,
    //     google_book_id: google_book_id
    //   };
    //   console.log('setVote', params);
    //   $http.post('/api/v1/book_votes.json', params).then(function(response) {
    //     console.log(response.data);
    //   });
    // };

    // $scope.showDescription = function(book){
    //   console.log($scope.showBookDescription);
    //   $scope.showBookDescription = !$scope.showBookDescription;
    // };
 
    window.$scope = $scope;  /* use for debugging in chrome console */
  });

})();
