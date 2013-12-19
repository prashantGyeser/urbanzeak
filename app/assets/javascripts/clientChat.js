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
    var leadId = makeCustomClientid();

    // Todo: Change this to the actual host id for this experience
    var currentExperienceHostId = 1;

    var baseCurrentHostUrl = 'https://urbanzeak.firebaseio.com/hosts/1/';
    var currentUserUrl = baseCurrentHostUrl + 'customers/';
    var currentUserMessagesUrl = currentUserUrl + 'messages/';

    var leadsUrl = 'https://urbanzeak-users-development.firebaseio.com/';
    var connectedUrl = leadsUrl + '.info/connected';

    var hostLeadListUrl = leadsUrl + currentExperienceHostId + '/leads/';

    // Setting a ref to the leads table
    var onlineRef = new Firebase(hostLeadListUrl);
    var connectedRef = new Firebase(connectedUrl);

    // Creating a reference to the leads table and adding a lead as soon as they land on the page
    connectedRef.on('value', function(snap){
        console.log('Conn:', snap.val());

        if(snap.val() === true){
            // The client is connected. Setup presence state and tell the server to set a timestamp when they leave
            var leadRef = onlineRef.child(leadId);
            var connRef = leadRef.child('online').push(1);

            // Actions to take on user disconnect
            connRef.onDisconnect().remove();

            // Store the last seen time stamp for this lead
            leadRef.child('logout').onDisconnect().set(Firebase.ServerValue.TIMESTAMP);

        }

    });

    // Getting all the people who have ever visited the site here.
    // Todo: Show only people that are currently on the site.
    //$scope.customers = $firebase(hostRef);
    //console.log("the values returned are:", $scope.customers);

    //$scope.usersOnPage = $firebase(presenceRef);
    //$scope.usersOnPage.$add({userId: userId});

    // Getting messages for this user
    //var messagesRef = new Firebase(currentUserMessagesUrl);

    //$scope.messages = $firebase(messagesRef);

    // Creating a reference to the messages for this user.
    //$scope.addMessage = function(e) {
        //if(e.keyCode != 13) return;
        //$scope.messages.$add({message: $scope.message});
        //$scope.message = '';
    //}
}]);