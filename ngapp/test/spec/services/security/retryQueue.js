'use strict';

describe('Service: SecurityRetryqueue', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecurityRetryqueue;
  beforeEach(inject(function (_SecurityRetryqueue_) {
    SecurityRetryqueue = _SecurityRetryqueue_;
  }));

  it('should do something', function () {
    expect(!!SecurityRetryqueue).toBe(true);
  });

});
