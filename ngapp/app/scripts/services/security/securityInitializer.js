'use strict';

// Based loosely around work by Witold Szczerba - https://github.com/witoldsz/angular-http-auth
// Code taken from https://github.com/angular-app/angular-app
angular.module('security', [
    'security.service',
    'security.interceptor',
    'security.login',
    'security.authorization']);
