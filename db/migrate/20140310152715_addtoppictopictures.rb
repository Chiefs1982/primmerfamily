class Addtoppictopictures < ActiveRecord::Migration
  def change
    add_column :pictures, :toppic, :integer
  end
end
