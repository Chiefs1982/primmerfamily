class Removepictures < ActiveRecord::Migration
  def change
    drop_table :pictures
  end
end
