class AddFilenameColumns < ActiveRecord::Migration
  def change
    rename_column :pictures, :filenames, :filename1
    add_column :pictures, :filename2, :string
    add_column :pictures, :filename3, :string
    add_column :pictures, :filename4, :string
    add_column :pictures, :filename5, :string
    add_column :pictures, :filename6, :string
    add_column :pictures, :filename7, :string
    add_column :pictures, :filename8, :string
    change_column :pictures, :filename1, :string
  end
end
