'use strict';

angular.module('urbanfunhunterApp')
  .factory('host', [function() {
    // Service logic
    // ...

    //var meaningOfLife = 42;

    var userId;

    // Public API here
    var service = {
        // Getting all the experiences this host has
        experiences: function(hostId){
            var request = $http({method: 'GET', url: 'api/v1/host/:id/experiences', params: {id: hostId}});
            return request.then(function(responce){
               service.hostExperiences = responce.data;
               return service.hostExperiences;
            });
        }
    };
    return service;

        /*
    return {
      someMethod: function() {
        return meaningOfLife;
      }
    };
    */
  }]);
