class ChangeNewsletterColumn < ActiveRecord::Migration
  def change
    rename_column :newsletters, :destroy, :remove_email
  end
end
