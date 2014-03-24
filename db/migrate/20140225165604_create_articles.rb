class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article_header
      t.text :article_body
      t.integer :article_id
      t.string :article_link
      t.boolean :article_pics
      t.boolean :article_video
      t.boolean :top_pics
      t.string :article_tags
      t.timestamps
    end

    create_table :pictures do |t|
      t.belongs_to :articles
      t.text :filenames
      t.boolean :top_pic
      t.timestamps
    end
    add_index :pictures, :articles_id
    add_index :articles, :article_id
  end

end
