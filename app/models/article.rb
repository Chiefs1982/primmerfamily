class Article < ActiveRecord::Base
before_save :check_toppic

  attr_accessible :article_header, :article_body,:article_id,:article_link,:article_pics,:article_video,:top_pics,:article_tags, :pictures_attributes
  #has_attached_file :picture
                    #:url  => "/system/pictures/article_pics/:basename.:extension",
                    #:path => ":rails_root/public/system/pictures/article_pics/:basename.:extension",
                    #:styles => { :large => "640x480>", :medium => "300x300>", :thumb => "100x100>"},
                    #:default_url => "/system/pictures/missing.jpg"
  #validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  has_many :pictures, :dependent => :destroy, :primary_key => :article_id
  has_many :comments, :dependent => :destroy, :primary_key => :article_id

  accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => proc { |attribute| attribute['picture_title'].blank?}
  
  validates :article_header, :presence => true, :length => {:maximum => 150}
  validates :article_body, :presence => true, :length => {:maximum => 3000}
  validates :article_id, :presence => true, :uniqueness => true
  validates :article_link, :presence => true, :length => {:maximum => 30}
  validates :article_pics, :inclusion => [true,false]
  validates :article_video, :inclusion => [true,false]
  validates :top_pics, :inclusion => [true,false]

  # validates :article_pics, :presence => true, :length => {:maximum => 1}
  # validates :article_video, :presence => true, :length => {:maximum => 1}
  # validates :top_pics, :presence => true, :length => {:maximum => 1}
  validates :article_tags, :length => {:maximum => 250}

  scope :regex_load, lambda { |regex_str|
    { :conditions => [" article_tags REGEXP ? " , regex_str] }
  }

  #default_scope :order => "articles.created_at DESC"

  #<% if ff.object.new_record? %>
  # add file upload here
  #<% end %>

  def reject_posts(attributed)
    attributed['picture_title'].blank?
  end

  private

      def check_toppic
        x = 0
        y = 0
        if !self.pictures.nil?
          self.pictures.each do |pic|
            if pic.toppic == 1
              x += 1
            elsif pic.toppic == 0
              y += 1
            end
          end
        end
        if x > 0
          self.top_pics = 1
        else
          self.top_pics = 0
        end

        if y > 0
          self.article_pics = 1
        else
          self.article_pics = 0
        end
      end

end
