'use strict';

describe('Controller: LoginCtrl', function () {

  // load the controller's module
  beforeEach(module('urbanfunhunterApp'));

  var LoginCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    $rootScope = $injector.get('$rootScope');
    LoginCtrl = $controller('LoginCtrl', {
      $scope: scope
    });
  }));

  it('should attach a user to the root scope', function () {
    expect(rootScope.user.email).toBe("prashant@gyeser.com");
  });
});
