'use strict';

angular.module('urbanfunhunterApp')
    .factory('newExperienceFactory', function ($http, $location) {

        var service = {}

        // This is the public service of the API
        return service = {
            // Send data to the backend to create a new experience
            save: function(experience){
                var request = $http.post('/api/v1/experiences.json',experience);
                return request.then(function(response){
                    service.newExperience = response.data;
                    var newExperiencePath = "/experiences/" + response.data.id;
                    $location.path(newExperiencePath);
                    return service.newExperience;
                });
            }
        };
        return service;
    });
