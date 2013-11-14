'use strict';

describe('Service: SecurityIndex', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecurityIndex;
  beforeEach(inject(function (_SecurityIndex_) {
    SecurityIndex = _SecurityIndex_;
  }));

  it('should do something', function () {
    expect(!!SecurityIndex).toBe(true);
  });

});
