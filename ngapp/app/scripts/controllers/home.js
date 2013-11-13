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
                name: 'Some awesome name',
                description: 'Some long description'
            },
            {
                name: 'Some awesome name',
                description: 'Some long description'
            },
            {
                name: 'Some awesome name',
                description: 'Some long description'
            }

        ];


    });
