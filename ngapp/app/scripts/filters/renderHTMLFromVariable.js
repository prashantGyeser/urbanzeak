'use strict';

angular.module('urbanfunhunterApp')
  .filter('renderhtml', function ($sce) {
    return function (input) {
        return $sce.trustAsHtml(input);
    };
  });
