'use strict';

describe('Service: MyexperiencesManage', function () {

  // load the service's module
  beforeEach(module('urbanfunhunterApp'));

  // instantiate service
  var MyexperiencesManage;
  beforeEach(inject(function (_MyexperiencesManage_) {
    MyexperiencesManage = _MyexperiencesManage_;
  }));

  it('should do something', function () {
    expect(!!MyexperiencesManage).toBe(true);
  });

});
