'use strict';

describe('Directive: textAngular', function () {

  // load the directive's module
  beforeEach(module('urbanfunhunterApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<text-angular></text-angular>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the textAngular directive');
  }));
});
