'use strict';

describe('Directive: addthis', function () {

  // load the directive's module
  beforeEach(module('urbanfunhunterApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<addthis></addthis>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the addthis directive');
  }));
});
