'use strict';

angular.module('urbanfunhunterApp')
    .controller('HomeCtrl', function ($scope, $modal, Experience) {

        Experience.experiences().then(function(data){
            $scope.experiences = data;
        });

        $scope.host = [{
            name: "Jane Doe",
            picture: "http://someurl"
        }];

    });


