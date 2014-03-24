require File.expand_path('lib/migration_helper')
include MigrationHelpers

class AddForeignKey < ActiveRecord::Migration


  def up
    add_foreign_key(:pictures, :article_id, :articles)
  end

  def down
    remove_foreign_key(:pictures, :article_id)
  end
end
