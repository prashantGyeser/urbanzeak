'use strict';

describe('Service: SecurityLoginLogin', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecurityLoginLogin;
  beforeEach(inject(function (_SecurityLoginLogin_) {
    SecurityLoginLogin = _SecurityLoginLogin_;
  }));

  it('should do something', function () {
    expect(!!SecurityLoginLogin).toBe(true);
  });

});
