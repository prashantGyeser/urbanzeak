var editorApp = angular.module('previewApp', ['firebase']);

editorApp.controller('RollerCtrl', ['$scope', '$firebase', function($scope, $firebase){
    var experienceBaseRef = new Firebase('https://uz-experiences-development.firebaseio.com/experience_id/1/experience/');
    var experienceRollersRef = new Firebase('https://uz-experiences-development.firebaseio.com/experience_id/1/rollers/');

    $scope.titleRollers = $firebase(experienceRollersRef);
    $scope.experienceContainer = $firebase(experienceBaseRef);

    //$scope.message = "Hello world";
}]);