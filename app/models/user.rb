class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation, :username, :user, :newsletter, :user_id, :comment_username, :forgot_pw
  has_attached_file :user,
                      :url => "/images/users/:username/:style/:savename.:extension",
                      :path => ":rails_root/public/images/users/:username/:style/:savename.:extension",
                      :styles => {:thumb => "50x50#"},
                      :default_url => "/images/users/default_avatar.jpg"
  has_many :comments, :dependent => :destroy, :primary_key => :user_id

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, :presence => true,
                   :length => {:maximum => 25}
  validates :lastname, :presence => true,
                   :length => {:maximum => 25}                 
  validates :username, :presence => true,
                       :length => { :maximum => 20},
                       :uniqueness => { :case_sensitive => false} 
  validates :email, :presence => true,
                    :format => { :with => email_regex},
                    :uniqueness => { :case_sensitive => false}
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :if => :password
  validates :user_id, :presence => true, :uniqueness => true
  validates :newsletter, :inclusion => [true,false]
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    if email =~ /@/
      user = find_by_email(email)
    else
      user = find_by_username(email)
    end
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end


  private
      
      def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
      end
      
      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end
      
      def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
      end
      
      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end
end
