var chatApp = angular.module('chatApp', ["firebase"]);

chatApp.controller('ChatCtrl', ['$scope', '$firebase', function($scope, $firebase){
    var hostUrl = "https://urbanzeak.firebaseio.com/hosts/1/customers/";
    var hostRef = new Firebase("https://urbanzeak.firebaseio.com/hosts/1/customers/");
    var leadsUrl = 'https://urbanzeak-users-development.firebaseio.com/1/leads'
    //var presenceUrl = 'https://urbanzeak-users-development.firebaseio.com/.info/connected'

    // Firebase initializations
    var leadsRef = new Firebase(leadsUrl);

    $scope.leads = $firebase(leadsRef);

    $scope.getMessages = function(leadId){
        console.log("the id clicked was:", leadId);
        var messagesUrl = 'https://urbanzeak-chat-development.firebaseio.com/hosts/1/leads/' + leadId + '/messages/';
        var messagesRef = new Firebase(messagesUrl);

        $scope.messages = $firebase(messagesRef);

    }

}]);