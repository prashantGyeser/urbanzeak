'use strict';

describe('Service: ExperiencesNew', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var ExperiencesNew;
  beforeEach(inject(function (_ExperiencesNew_) {
    ExperiencesNew = _ExperiencesNew_;
  }));

  it('should do something', function () {
    expect(!!ExperiencesNew).toBe(true);
  });

});
