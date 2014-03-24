class Comment < ActiveRecord::Base
  attr_writer :comment_form
  attr_accessible :article_id, :comment, :user_id
  belongs_to :user
  belongs_to :article

  validates :comment, :presence => true, :length => {:maximum => 250}
  validates :article_id, :presence => true
  validates :user_id, :presence => true
end
