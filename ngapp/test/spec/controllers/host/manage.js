'use strict';

describe('Controller: HostManageCtrl', function () {

  // load the controller's module
  beforeEach(module('urbanfunhunterApp'));

  var HostManageCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    HostManageCtrl = $controller('HostManageCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
