var chatApp = angular.module('chatApp', ["firebase"]);

chatApp.controller('ChatCtrl', ['$scope', '$firebase', function($scope, $firebase){
    var hostUrl = "https://urbanzeak.firebaseio.com/hosts/1/customers/";
    var hostRef = new Firebase("https://urbanzeak.firebaseio.com/hosts/1/customers/");
    var leadsListUrl = 'https://urbanzeak-users-development.firebaseio.com/1/';
    var leadUrl = 'https://urbanzeak-users-development.firebaseio.com/1/lead'
    var presenceUrl = 'https://urbanzeak-users-development.firebaseio.com/.info/connected'

    // Firebase initializations
    var leadRef = new Firebase(leadUrl);
    var presenceRef = new Firebase(presenceUrl);

    presenceRef.on('value', function(snap){
        if (snap.val()){
            console.log('Ok there is a connection', snap.val());
            $scope.test = snap.val();

            leadRef.push("hello");

        }
    })





}]);