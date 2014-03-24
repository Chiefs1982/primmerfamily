class FixPicturesColumnName < ActiveRecord::Migration
  def change
    rename_column :pictures, :articles_id, :article_id
  end
end
