class AddAttachmentPicmonthToPicOfTheMonths < ActiveRecord::Migration
  def change
    create_table :pic_of_the_months do |t|
      t.attachment :picmonth
      t.integer :month
      t.integer :year
      t.text :title

    end
  end
end
