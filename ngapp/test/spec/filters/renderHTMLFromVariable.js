'use strict';

describe('Filter: renderHTMLFromVariable', function () {

  // load the filter's module
  beforeEach(module('urbanfunhunterApp'));

  // initialize a new instance of the filter before each test
  var renderHTMLFromVariable;
  beforeEach(inject(function ($filter) {
    renderHTMLFromVariable = $filter('renderHTMLFromVariable');
  }));

  it('should return the input prefixed with "renderHTMLFromVariable filter:"', function () {
    var text = 'angularjs';
    expect(renderHTMLFromVariable(text)).toBe('renderHTMLFromVariable filter: ' + text);
  });

});
