class AddToPics < ActiveRecord::Migration
  def change
    remove_column :pictures, :filename1
    remove_column :pictures, :filename2
    remove_column :pictures, :filename3
    remove_column :pictures, :filename4
    remove_column :pictures, :filename5
    remove_column :pictures, :filename6
    remove_column :pictures, :filename7
    remove_column :pictures, :filename8
    remove_column :pictures, :top_pic

    add_column :pictures, :picture_file_name, :string
    add_column :pictures, :picture_content_type, :string
    add_column :pictures, :picture_file_size, :integer
    add_column :pictures, :picture_updated_at, :datetime
  end
end
