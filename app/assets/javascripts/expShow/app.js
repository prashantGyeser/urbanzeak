var editorApp = angular.module('editorApp', ['firebase']);

editorApp.controller('EditorCtrl', ['$scope', '$firebase', function($scope, $firebase){
    // Todo: REplace the experience id with the actual preview id or generate a random id
    var experienceBaseRef = new Firebase('https://uz-experiences-development.firebaseio.com/experience_id/1/experience');
    var experienceRollersRef = new Firebase('https://uz-experiences-development.firebaseio.com/experience_id/1/rollers/');

    $scope.rollerItems = $firebase(experienceRollersRef);
    $scope.experience = $firebase(experienceBaseRef);

    $scope.addRollerItem = function(){
        $scope.rollerItems.$add({title: $scope.rollerTitle});
        //$scope.rollerTitle = '';
    };

    $scope.addSummary = function(){
        $scope.experience.$add({summary: $scope.experienceSummary});
        $scope.experienceSummary = '';
    };

}]);