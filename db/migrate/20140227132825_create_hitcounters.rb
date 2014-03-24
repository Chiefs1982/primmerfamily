class CreateHitcounters < ActiveRecord::Migration
  def change
    create_table :hitcounters, :id => false do |t|
      t.integer :hit_counter
    end
  end
end
