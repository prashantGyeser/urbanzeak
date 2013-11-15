'use strict';

describe('Service: LoginLogin', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var LoginLogin;
  beforeEach(inject(function (_LoginLogin_) {
    LoginLogin = _LoginLogin_;
  }));

  it('should do something', function () {
    expect(!!LoginLogin).toBe(true);
  });

});
