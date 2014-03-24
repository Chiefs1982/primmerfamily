class Addsuperuser < ActiveRecord::Migration
  def change
    rename_column :users, :check, :check_salt
    add_column :users, :super_user, :boolean
  end
end
