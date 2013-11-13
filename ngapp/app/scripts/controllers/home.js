'use strict';

angular.module('urbanfunhunterApp')
    .controller('HomeCtrl', function ($scope, $modal) {
        $scope.awesomeThings = [
          'HTML5 Boilerplate',
          'AngularJS',
          'Karma'
        ];

        $scope.experiences = [
            {
                name: 'This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            },
            {
                name: 'Some awesome name This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            },
            {
                name: 'Some awesome name This is filler. The data needs to come from a service',
                description: 'Some long description This is filler. The data needs to come from a service'
            }

        ];

        $scope.host = [{
            name: "Jane Doe",
            picture: "http://someurl"
        }];


        $scope.items = ['item1', 'item2', 'item3'];

        $scope.open = function () {

            var modalInstance = $modal.open({
                templateUrl: 'myModalContent.html',
                controller: ModalInstanceCtrl,
                resolve: {
                    items: function () {
                        return $scope.items;
                    }
                }
            });

            modalInstance.result.then(function (selectedItem) {
                $scope.selected = selectedItem;
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        };


    });

var ModalInstanceCtrl = function ($scope, $modalInstance, items) {

    $scope.items = items;
    $scope.selected = {
        item: $scope.items[0]
    };

    $scope.ok = function () {
        $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
};
    /*
    .controller('ModalInstanceCtrl', [ '$scope', '$modalInstance', 'items', function ($scope, $modalInstance, items) {
        $scope.items = items;
        $scope.selected = {
            item: $scope.items[0]
        };

        $scope.ok = function () {
            $modalInstance.close($scope.selected.item);
        };

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        };
    }]);
    */

