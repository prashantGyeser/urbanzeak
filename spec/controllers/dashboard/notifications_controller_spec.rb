require 'spec_helper'

describe Dashboard::NotificationsController do

  describe "GET 'communication'" do
    it "returns http success" do
      get 'communication'
      response.should be_success
    end
  end

end
