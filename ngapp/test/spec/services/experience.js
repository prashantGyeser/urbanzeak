'use strict';

describe('Service: Experience', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var Experience;
  beforeEach(inject(function (_Experience_) {
    Experience = _Experience_;
  }));

  it('should do something', function () {
    expect(!!Experience).toBe(true);
  });

});
