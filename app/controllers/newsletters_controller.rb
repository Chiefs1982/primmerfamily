class NewslettersController < ApplicationController
  def create
    @news = Newsletter.new(params[:newsletter])
    @u = User.find_by_email(@news.email)
    make_forgot_pw(@news)
    unless @u.nil?
      if @u.newsletter == false
        @u.update_attributes(:newsletter => true, :forgot_pw => @news.forgot_pw)
      end
    end
    if @news.save
      MainMailer.newsletter_email(@news).deliver
      flash[:success] = "You have successfully signed up for the Newsletter! Thank You!"
      redirect_to root_path
    else
      flash[:error] = "There was an error signing up!"
      redirect_to root_path
    end
  end

  def destroy
    @n = Newsletter.find_by_forgot_pw(params[:id])
    @u = User.find_by_forgot_pw(params[:id])
    unless @u.nil?
      if @u.newsletter == true
        make_forgot_pw(@u)
        @u.update_attributes(:newsletter => false, :forgot_pw => @u.forgot_pw)
      end
    end
    if @n.destroy
      flash[:success] = "You have been taken off of the newsletter mailing list.  Thank you."
      redirect_to newsletters_path
    else
      flash[:error] = "There was a problem removing your email from the mailing list.  Please contact me at info@primmerfamily.net so I can take you off manually.  Thank you."
      redirect_to newsletters_path
    end
  end

  def index
    @title = "Newsletter"
  end
end
