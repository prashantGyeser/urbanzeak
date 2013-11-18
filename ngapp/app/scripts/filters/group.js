'use strict';

angular.module('urbanfunhunterApp')
  .filter('group', function () {
    /**
     * splits an array into groups of the given size
     * e.g. ([1, 2, 3, 4, 5], 2) -> [[1, 2], [3, 4], [5]]
     */
    return function(array, groupSize) {
        return _.groupBy(array, function(val, index) {
            return Math.floor(index / groupSize);
        });
    }
  });