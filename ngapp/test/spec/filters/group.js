'use strict';

describe('Filter: group', function () {

  // load the filter's module
  beforeEach(module('urbanfunhunterApp'));

  // initialize a new instance of the filter before each test
  var group;
  beforeEach(inject(function ($filter) {
    group = $filter('group');
  }));

  it('should return the input prefixed with "group filter:"', function () {
    var text = 'angularjs';
    expect(group(text)).toBe('group filter: ' + text);
  });

});
