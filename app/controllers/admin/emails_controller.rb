class Admin::EmailsController < ApplicationController
  before_filter :authenticate
  before_filter :adminuser
  
  def index
    @title = "Admin: Emails"
    @emails = Contact.paginate(:per_page => 20, :page => params[:page])
  end

  def show
    @title = "Admin: Emails"
    @email = Contact.find(params[:id])
  end
end
