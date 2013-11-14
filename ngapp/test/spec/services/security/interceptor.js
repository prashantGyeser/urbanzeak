'use strict';

describe('Service: SecurityInterceptor', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecurityInterceptor;
  beforeEach(inject(function (_SecurityInterceptor_) {
    SecurityInterceptor = _SecurityInterceptor_;
  }));

  it('should do something', function () {
    expect(!!SecurityInterceptor).toBe(true);
  });

});
