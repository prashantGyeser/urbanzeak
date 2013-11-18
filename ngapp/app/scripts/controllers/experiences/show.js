'use strict';

angular.module('urbanfunhunterApp')
  .controller('ExperiencesShowCtrl', function ($scope, Experience, $routeParams) {
        console.log("Tjhe route params for experienceId is:" + $routeParams.experienceId)
        Experience.getEvent($routeParams.experienceId).then(function(data){
            $scope.experience = data;
            console.log("The experience desc is:" + $scope.experience.description);
        });
  });
