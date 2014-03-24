class Contact < ActiveRecord::Base
  attr_accessible :email, :body, :subject
end
