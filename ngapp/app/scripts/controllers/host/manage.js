'use strict';

angular.module('urbanfunhunterApp')
  .controller('HostManageCtrl', function ($scope, host) {
        $scope.experiences = {};

        $scope.getExperiencesForHost = function(){
            host.experiences()
        };


  });
