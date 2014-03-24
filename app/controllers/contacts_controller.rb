class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    if signed_in?
      @user = User.find(current_user)
      @contact.user_id = @user.user_id
    end
    
    if @user.nil?
      if MainMailer.contact_email(@contact).deliver
        flash[:success] = "Your email has been sent, and I will get back to you as soon as possible.  Thank you!"
        @contact.save
        redirect_to contact_path and return
      else
        flash[:error] = "There was an error sending out the email, probably on our end, please try again.  Thank you!"
        render 'new' and return
      end
    else
      if MainMailer.contact_email(@contact,@user).deliver
        flash[:success] = "Your email has been sent, and I will get back to you as soon as possible.  Thank you!"
        @contact.save
        redirect_to contact_path and return
      else
        flash[:error] = "There was an error sending out the email, probably on our end, please try again.  Thank you!"
        render 'new' and return
      end
    end
  end

  def new
    @title = "Contact"
    @contact = Contact.new
  end
end
