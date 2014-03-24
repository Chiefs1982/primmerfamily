class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.integer :month
      t.integer :day
      t.timestamps
    end
  end
end
