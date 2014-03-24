class MainMailer < ActionMailer::Base
  default from: "info@primmerfamily.net"

  def welcome_email(user)
    @user = user
    @url = 'http://primmerfamily.net'
    mail(:to => "#{user.email}", :subject => 'Welcome to my  awesome site')
  end

  def newsletter_email(user)
    @user = user
    @url = "#{newsletterdelete_url(user.forgot_pw)}"
    mail(:to => "#{user.email}", :subject => 'Signed Up For Newsletter')
  end

  def contact_email(send, user = nil)
    @u = user
    @email = send
    mail(:from => "#{send.email}", :to => "info@primmerfamily.net", :subject => "#{send.subject}")
  end

  def forgot_password(user)
    @u = user
    mail(:to => "#{user.email}", :subject => "PrimmerFamily.net request for password reset")
  end
end
