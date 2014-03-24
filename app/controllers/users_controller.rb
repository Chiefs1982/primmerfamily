class UsersController < ApplicationController
  before_filter :signed_in?, :only => [:edit, :show, :update, :destroy]
  #before_filter :correct_user, :only => [:edit, :update, :destroy]

  def new
    if signed_in?
      redirect_to root_path
    end
    @user = User.new
    @title = "Sign Up"
  end

  def show
    if super_user || correct_user
      @user = User.find_by_username(params[:id])
      @title = "#{@user.firstname} #{@user.lastname}"
    end
  end

  def create
    rand_user
    @user = User.new(params[:user])
    make_forgot_pw(@user)
    if params[:user][:newsletter] == "1"
      @news = Newsletter.new({:email => @user.email, :forgot_pw => @user.forgot_pw})
      @news.save
    end
    if @user.save
      MainMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Thank you for signing up.  Welcome to PrimmerFamily.net!"
      redirect_to root_path
    else
      @title = "Sign up"
      flash[:error] = "There was a problem creating your account!"
      render 'new'
    end
  end

  def edit
    if super_user || correct_user
      @title = "User Profile Edit"
      @user = User.find_by_username(params[:id])
    end
  end

  def update
    if super_user || correct_user
      @u = User.find_by_username(params[:id])
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      if @u.update_attributes(params[:user])
        flash[:success] = "Profile Updated"
        redirect_to user_path(@u.username)
      else
        @title = "User Profile Edit"
        flash[:error] = "There was a problem updating the profile!"
        redirect_to edit_user_path(@u.username)
      end
    end
  end

  def destroy
    if super_user || same_user_id
      u = User.find_by_user_id(params[:id])
      n = Newsletter.find_by_email(u.email)
      if !n.nil?
        n.destroy
      end
      if u.destroy
        flash[:success] = "User has been deleted!"
        if !super_user
          sign_out
        end
        redirect_to root_path and return
      else
        flash[:error] = "There was an error deleting user!"
        redirect_to root_path and return
      end
    else
      redirect_to root_path and return
    end
  end

  private
      
      def rand_user
        user_check = User.last
        userid = (user_check.user_id + 1)
        params[:user][:user_id] = userid
      end
end
