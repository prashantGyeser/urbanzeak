'use strict';

describe('Controller: HomeCtrl', function () {

    // load the controller's module
    beforeEach(module('urbanfunhunterApp'));

    // load the angular-ui bootstrap module
    beforeEach(module('ui.bootstrap'));

    var HomeCtrl,
    scope;

    // Initialize the controller and a mock scope
    beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    HomeCtrl = $controller('HomeCtrl', {
      $scope: scope
    });
    }));

    it('should attach a list of experiences to the scope', function () {
    expect(scope.experiences.length).toBe(3);
    });

    it('should attach a sample host to the scope', function(){
        expect(scope.host.length).toBe(1);
    });



});
