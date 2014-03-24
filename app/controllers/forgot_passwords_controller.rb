class ForgotPasswordsController < ApplicationController
  def new
    @title = "Forgot Password"
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.nil?
      flash[:error] = "The information for #{@user.email} is not valid or does not match any user."
      render 'new' and return
    else
      if MainMailer.forgot_password(@user).deliver
        flash[:success] = "An email has been sent to that email, just click the link to reset the password."
        redirect_to show_fp_path and return
      else
        flash[:error] = "There was a problem sending you an email, please try again."
        render 'new' and return
      end
    end

  end

  def show
    @title = "Forgot Password"
  end

  def restore
    @title = "Restore Password"
    @u = User.find_by_forgot_pw(params[:id])
    if @u.nil?
      flash[:error] = "There was a problem, try again."
      redirect_to new_fp_path and return
    else
      @user = User.new
      @user.forgot_pw = params[:id]
    end
  end

  def update
    @user = User.find_by_email_and_forgot_pw(params[:user][:email],params[:id])
    if @user.nil?
      flash[:error] = "There was a problem, try again."
      redirect_to new_fp_path and return
    else
      make_forgot_pw(@user)
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation], :forgot_pw => @user.forgot_pw)
        flash[:success] = "Your password has been updated.  Please sign in to your account."
        redirect_to signin_path and return
      else
        flash[:error] = "There was a problem, please try again."
        redirect_to new_fp_path and return
      end
    end
  end
end
