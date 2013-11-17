'use strict';

angular.module('urbanfunhunterApp')
  .factory('myexperiences.manage', function () {
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
