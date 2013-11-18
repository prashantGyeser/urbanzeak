'use strict';

angular.module('urbanfunhunterApp')
  .controller('ExperiencesShowCtrl', function ($scope, Experience, $routeParams) {
        console.log("Tjhe route params for experienceId is:" + $routeParams.experienceId)
        Experience.getEvent($routeParams.experienceId).then(function(data){
            $scope.experience = data;
            console.log("The experience desc is:" + $scope.experience.description);
        });

        Experience.getExperienceImages($routeParams.experienceId).then(function(data){
            $scope.slides = data;
            console.log("The experience desc is:" + $scope.experience.description);
        });



        $scope.myInterval = 5000;

        // Google maps call -- start
        angular.extend($scope, {

            position: {
                coords: {
                    latitude: 45,
                    longitude: -73
                }
            },

            /** the initial center of the map */
            centerProperty: {
                latitude: 45,
                longitude: -73
            },

            /** the initial zoom level of the map */
            zoomProperty: 4,

            /** list of markers to put in the map */
            markersProperty: [ {
                latitude: 45,
                longitude: -74
            }],

            // These 2 properties will be set when clicking on the map
            clickedLatitudeProperty: null,
            clickedLongitudeProperty: null,

            eventsProperty: {
                click: function (mapModel, eventName, originalEventArgs) {
                    // 'this' is the directive's scope
                    $log.log("user defined event on map directive with scope", this);
                    $log.log("user defined event: " + eventName, mapModel, originalEventArgs);
                }
            }
        });
        // Google maps call -- end

        /*
        var slides = $scope.slides = [];
        $scope.addSlide = function() {
            var newWidth = 200 + ((slides.length + (25 * slides.length)) % 150);
            slides.push({
                image: 'http://placekitten.com/' + newWidth + '/200',
                text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
                    ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]
            });
        };
        for (var i=0; i<4; i++) {
            $scope.addSlide();
        }
        */
  });
