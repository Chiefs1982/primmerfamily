class Add < ActiveRecord::Migration
  def change
    add_column :users, :forgot_pw, :string
  end
end
