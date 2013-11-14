'use strict';

describe('Service: Httprequesttracker', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var Httprequesttracker;
  beforeEach(inject(function (_Httprequesttracker_) {
    Httprequesttracker = _Httprequesttracker_;
  }));

  it('should do something', function () {
    expect(!!Httprequesttracker).toBe(true);
  });

});
