'use strict';

describe('Service: ExperiencesExperience', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var ExperiencesExperience;
  beforeEach(inject(function (_ExperiencesExperience_) {
    ExperiencesExperience = _ExperiencesExperience_;
  }));

  it('should do something', function () {
    expect(!!ExperiencesExperience).toBe(true);
  });

});
