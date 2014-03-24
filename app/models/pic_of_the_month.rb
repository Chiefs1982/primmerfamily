class PicOfTheMonth < ActiveRecord::Base
  #attr_accessor :picmonth_file_name, :picmonth_content_type, :picmonth_file_size, :picmonth_updated_at
  attr_accessible :month, :year, :picmonth, :title, :picmonth_attributes
  has_attached_file :picmonth,
                        :url => "/images/potm/:style/:potm.:extension",
                        :path => ":rails_root/public/images/potm/:style/:potm.:extension",
                        :styles => {:large => "640x480>", :thumb => "290x290>"},
                        :default_url => "/images/default/potm_default.jpg"
  
  validates :month, :uniqueness => {:scope => :year}
  validates :title, :presence => true, :length => {:maximum => 250}
end
