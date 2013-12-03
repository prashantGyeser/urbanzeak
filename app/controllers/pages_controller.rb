class PagesController < ApplicationController

  before_filter :authenticate_user!, :only => [:sell]

  def sell
    @user = current_user
  end

  def about
  end

  def contact
  end

  def terms

  end

  def privacy

  end

end
