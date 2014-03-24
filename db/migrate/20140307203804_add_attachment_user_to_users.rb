class AddAttachmentUserToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :user
    end
  end

  def self.down
    drop_attached_file :users, :user
  end
end
