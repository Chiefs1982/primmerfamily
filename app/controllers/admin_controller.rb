class AdminController < ApplicationController
  before_filter :authenticate
  before_filter :adminuser

  def index
    @title = "Admin Home"
    @users = User.all
  end

end
