'use strict';

describe('Controller: ExperiencesShowCtrl', function () {

  // load the controller's module
  beforeEach(module('urbanfunhunterApp'));

  var ExperiencesShowCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ExperiencesShowCtrl = $controller('ExperiencesShowCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
