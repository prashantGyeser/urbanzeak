angular.module('security.login.toolbar', [])

// The loginToolbar directive is a reusable widget that can show login or logout buttons
// and information the current authenticated user
    .directive('loginToolbar', ['security', function(security, $cookieStore) {
        var directive = {
            templateUrl: 'views/toolbar.html',
            restrict: 'E',
            replace: true,
            scope: true,
            link: function($scope, $element, $attrs, $controller) {
                //scope.$watch()
                $scope.isAuthenticated = security.isAuthenticated;
                $scope.currentUserId = security.currentUserId;
                $scope.login = security.showLogin;
                $scope.logout = security.logout;
                $scope.$watch(function() {
                    return security.currentUser;
                }, function(currentUser) {
                    $scope.currentUser = currentUser;
                });
            }
        };
        return directive;
    }]);