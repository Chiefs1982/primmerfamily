class Newsletter < ActiveRecord::Base
  attr_accessible :email, :forgot_pw


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :format => { :with => email_regex},
                    :uniqueness => { :case_sensitive => false}
  #validates :forgot_pw, :presence => true, :length => {:minimum => 25}
end
