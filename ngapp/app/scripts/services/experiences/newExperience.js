'use strict';

angular.module('urbanfunhunterApp')
    .factory('newExperienceFactory', function () {
        // Service logic
        // ...

        var meaningOfLife = 42;

        // Public API here
        return {
            someMethod: function () {
                return meaningOfLife;
            }
        };
    });
