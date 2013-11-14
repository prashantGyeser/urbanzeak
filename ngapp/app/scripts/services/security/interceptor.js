'use strict';

angular.module('urbanfunhunterApp')
  .factory('securityInterceptor', function () {
    return function(promise) {
        // Intercept failed requests
        return promise.then(null, function(originalResponse) {
            if(originalResponse.status === 401) {
                // The request bounced because it was not authorized - add a new request to the retry queue
                promise = queue.pushRetryFn('unauthorized-server', function retryRequest() {
                    // We must use $injector to get the $http service to prevent circular dependency
                    return $injector.get('$http')(originalResponse.config);
                });
            }
            return promise;
        });
    };
  });
