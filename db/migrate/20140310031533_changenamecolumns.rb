class Changenamecolumns < ActiveRecord::Migration
  def change
    rename_column :users, :name, :firstname
    add_column :users, :lastname, :string
  end
end
