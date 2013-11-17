'use strict';

describe('Controller: ExperiencesNewCtrl', function () {

  // load the controller's module
  beforeEach(module('urbanfunhunterApp'));

  var ExperiencesNewCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ExperiencesNewCtrl = $controller('ExperiencesNewCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
