class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :article_id
      t.text :comment

      t.timestamps
    end

    add_index :comments, :user_id, :unique => false
    add_index :comments, :article_id, :unique => false
  end
end
