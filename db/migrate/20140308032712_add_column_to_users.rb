class AddColumnToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :password, :encrypted_password
      t.boolean :newsletter
      t.boolean :admin
    end
  end
end
