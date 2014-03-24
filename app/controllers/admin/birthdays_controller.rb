class Admin::BirthdaysController < ApplicationController
  before_filter :authenticate
  before_filter :adminuser

  def new
    @title = "Admin: New Birthday"
    @bday = Birthday.new
  end

  def create
    @bday = Birthday.new(params[:birthday])
    if @bday.save
      flash[:success] = "Birthday Created!"
      redirect_to admin_root_path
    else
      flash[:error] = "There was a problem saving record."
      render 'new'
    end
  end

  def update
    @b = Birthday.find(params[:id])
    if @b.update_attributes(params[:birthday])
      flash[:success] = "Birthday Updated!"
      redirect_to admin_birthdays_path
    else
      @title = "Admin: Edit Birthday"
      flash[:error] = "There was a problem updating the Article!"
      render 'edit'
    end

  end

  def edit
    @title = "Admin: Edit Birthday"
    @bday = Birthday.find(params[:id])
  end

  def index
    @title = "Admin: All Birthdays"
    @bday = Birthday.where(:month => @months).order("month ASC, day ASC")
  end

  def destroy
    @bday = Birthday.find(params[:id])
    if @bday.destroy
      flash[:success] = "Birthday Deleted!"
      redirect_to admin_birthdays_path
    else
      @title = "Admin: All Birthdays"
      flash[:error] = "There was a problem deleting record!"
      render 'index'
    end
  end

  private

      
end
