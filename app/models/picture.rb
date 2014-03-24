#require 'mini_magick'
class Picture < ActiveRecord::Base
  
  belongs_to :article, :primary_key => :article_id
  #has_attached_file :picture#, :styles => { :large => "640x480>", :medium => "300x300>", :thumb => "100x100>"}
  #serialize :filenames
  has_attached_file :picture,
                    :url  => "/images/pictures/article_pics/:style/:basename.:extension",
                    :path => ":rails_root/public/images/pictures/article_pics/:style/:basename.:extension",
                    :styles => { :large => "640x480>", :thumb => "200x200>"},
                    :default_url => "/images/default/article_default.jpg"
  attr_accessible :picture, :picture_title, :toppic

  validates :picture_title, :presence => true, :length => {:maximum => 150}
  validates :toppic, :presence => true, :length => {:maximum => 1}
  
  
end
