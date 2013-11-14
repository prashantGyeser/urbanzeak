'use strict';

describe('Service: SecuritySecurity', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecuritySecurity;
  beforeEach(inject(function (_SecuritySecurity_) {
    SecuritySecurity = _SecuritySecurity_;
  }));

  it('should do something', function () {
    expect(!!SecuritySecurity).toBe(true);
  });

});
