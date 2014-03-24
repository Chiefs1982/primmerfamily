class Addpicturetext < ActiveRecord::Migration
  def change
    add_column :pictures, :picture_title, :string
    add_index :pictures, :article_id
  end
end
