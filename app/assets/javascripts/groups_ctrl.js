/* global angular */

(function() {
  "use strict";

  // changed $scope to bobScope because of minification
  // because of the array ['$scope', '$http', function(anyNameScope)... can be named anything]

  angular.module("app").controller("groupsCtrl", function($scope) {

    $scope.showGroupGenres = function() {
      console.log('hello');
      // inputDog.groupVisible = !inputDog.groupVisible;
    }

    window.$scope = $scope;  /* use for debugging in chrome console */
  });
})();
