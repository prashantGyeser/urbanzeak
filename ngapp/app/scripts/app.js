'use strict';

angular.module('urbanfunhunterApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ui.bootstrap',
    //'security'
        'security.interceptor'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/home.html',
        controller: 'HomeCtrl'
      })
      .when('/experiences', {
        templateUrl: 'views/experiences.html',
        controller: 'ExperiencesCtrl'
      })
      .when('/login', {
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
      });
        /*
      .otherwise({
        redirectTo: '/'
      });
      */
  });
