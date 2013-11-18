'use strict';

angular.module('urbanfunhunterApp')
  .factory('Experience', function ($http) {
    // Service logic

    // Public API
    var experience = {
      getEvent: function (experienceId) {
          var experienceShowURL = '/api/v1/experiences/' + experienceId;
          var promise = $http.get(experienceShowURL).then(function(response){
              console.log(response);
              return response.data;
          });
          return promise;
      }
    };
    return experience;
  });
