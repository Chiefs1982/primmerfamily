class Admin::PicOfTheMonthsController < ApplicationController
  before_filter :authenticate
  before_filter :adminuser
  
  def index
    @title = "Admin: PotM All"
    @potm = PicOfTheMonth.all
  end

  def new
    @title = "Admin: New PotM"
    @potm = PicOfTheMonth.new
  end

  def create
    @potm = PicOfTheMonth.new(params[:pic_of_the_month])
    if @potm.save
      flash[:success] = "Picture of the Month Created!"
      redirect_to admin_root_path
    else
      @title = "Admin: New PotM"
      flash[:error] = "There was a problem creating the Picture of the Month!"
      render 'new'
    end

  end

  def update
    @potm = PicOfTheMonth.find(params[:id])
    if @potm.update_attributes(params[:pic_of_the_month])
      flash[:success] = "Pic of the Month Updated!"
      redirect_to admin_root_path
    else
      @title = "Admin: Edit PotM"
      flash[:error] = "There was a problem updating the Picture of the Month! Maybe the month and year are already saved!"
      render 'edit'
    end
  end

  def edit
    @title = "Admin: Edit PotM"
    @potm = PicOfTheMonth.find(params[:id])
  end

  def destroy
    @potm = PicOfTheMonth.find(params[:id])
    if @potm.destroy
      flash[:success] = "Pic of the Month Deleted"
      redirect_to admin_root_path
    else
      flash[:error] = "Pic of the Month not Deleted!"
      redirect_to admin_root_path
    end
  end
end
