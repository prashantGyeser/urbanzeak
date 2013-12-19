var chatApp = angular.module('chatApp', ["firebase"]);

chatApp.controller('ChatCtrl', ['$scope', '$firebase', function($scope, $firebase){
    var hostUrl = "https://urbanzeak.firebaseio.com/hosts/1/customers/";
    var hostRef = new Firebase("https://urbanzeak.firebaseio.com/hosts/1/customers/");

    // Getting all the people who have ever visited the site here.
    // Todo: Show only people that are currently on the site.
    //$scope.customers = $firebase(hostRef);

}]);