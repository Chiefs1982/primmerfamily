class AddAttachmentPictureToPictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.attachment :picture
      t.integer :article_id
    end
  end

  def self.down
    drop_attached_file :pictures, :picture
  end
end
