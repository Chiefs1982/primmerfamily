class Changesaly < ActiveRecord::Migration
  def change
    rename_column :users, :check_salt, :salt
  end
end
