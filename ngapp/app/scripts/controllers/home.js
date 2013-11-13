'use strict';

angular.module('urbanfunhunterApp')
    .controller('HomeCtrl', function ($scope) {
        $scope.awesomeThings = [
          'HTML5 Boilerplate',
          'AngularJS',
          'Karma'
        ];

        $scope.experiences = [
            {
                name: 'This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            },
            {
                name: 'Some awesome name This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            },
            {
                name: 'Some awesome name This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            }

        ];

        $scope.host = [{
            name: "Jane Doe",
            picture: "http://someurl"
        }];


    });
