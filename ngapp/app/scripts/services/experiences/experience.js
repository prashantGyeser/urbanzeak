'use strict';

angular.module('urbanfunhunterApp')
  .factory('Experience', function ($http) {
    // Service logic

    // Public API
    var experience = {
      experiences: function(){
          var experienceIndexURL = '/api/v1/experiences/';
          var promise = $http.get(experienceIndexURL).then(function(response){
              console.log(response);
              return response.data;
          });
          return promise;
      },
      getEvent: function (experienceId) {
          var experienceShowURL = '/api/v1/experiences/' + experienceId;
          var promise = $http.get(experienceShowURL).then(function(response){
              console.log(response);
              return response.data;
          });
          return promise;
      },
      getExperienceImages: function(experienceId) {
          var experienceImagesURL = '/api/v1/experiences/' + experienceId + '/images';
          var promise = $http.get(experienceImagesURL).then(function(response){
              return response.data;
          });
          return promise;
      }

    };
    return experience;
  });
