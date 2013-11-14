'use strict';

describe('Service: SecurityAuthorization', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var SecurityAuthorization;
  beforeEach(inject(function (_SecurityAuthorization_) {
    SecurityAuthorization = _SecurityAuthorization_;
  }));

  it('should do something', function () {
    expect(!!SecurityAuthorization).toBe(true);
  });

});
