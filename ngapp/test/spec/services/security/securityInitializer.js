'use strict';

describe('Service: SecuritySecurityinitializer', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecuritySecurityinitializer;
  beforeEach(inject(function (_SecuritySecurityinitializer_) {
    SecuritySecurityinitializer = _SecuritySecurityinitializer_;
  }));

  it('should do something', function () {
    expect(!!SecuritySecurityinitializer).toBe(true);
  });

});
