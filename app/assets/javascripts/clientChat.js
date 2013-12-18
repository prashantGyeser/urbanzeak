// Common functions
function makeCustomClientid()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 16; i++ )
    {
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    }


    return text;
}

// Angularjs based chat
var chatApp = angular.module('clientchatApp', ["firebase"]);

chatApp.controller('ClientchatCtrl', ['$scope', '$firebase', function($scope, $firebase){
    // Creating a uid for this user
    var userId = makeCustomClientid();

    var baseCurrentHostUrl = 'https://urbanzeak.firebaseio.com/hosts/1/';
    var presenceUrl = baseCurrentHostUrl + 'usersViewing/';
    var currentUserUrl = baseCurrentHostUrl + 'customers/' + userId + '/';
    var currentUserMessagesUrl = currentUserUrl + 'messages/';


    //var hostRef = new Firebase("https://urbanzeak.firebaseio.com/hosts/1/customers/");

    // Getting all the people who have ever visited the site here.
    // Todo: Show only people that are currently on the site.
    //$scope.customers = $firebase(hostRef);
    //console.log("the values returned are:", $scope.customers);

    // Adding a user to the list of users when they view the page.
    var presenceRef = new Firebase(presenceUrl);
    //$scope.usersOnPage = $firebase(presenceRef);
    //$scope.usersOnPage.$add({userId: userId});

    // Getting messages for this user
    var messagesRef = new Firebase(currentUserMessagesUrl);

    $scope.messages = $firebase(messagesRef);

    // Creating a reference to the messages for this user.
    $scope.addMessage = function(e) {
        if(e.keyCode != 13) return;
        $scope.messages.$add({message: $scope.message});
        $scope.message = '';
    }
}]);