'use strict';

angular.module('urbanfunhunterApp')
    .factory('newExperienceFactory', function ($http) {

        var service = {}

        // This is the public service of the API
        return service = {
            // Send data to the backend to create a new experience
            save: function(experience){
                var request = $http.post('/api/v1/experiences.json',experience);
                return request.then(function(response){
                    console.log(response);
                    return response;
                });
            }
        };
        return service;
    });
