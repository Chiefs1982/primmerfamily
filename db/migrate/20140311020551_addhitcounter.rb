class Addhitcounter < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :hit_counter
      t.string :session_hash
      t.string :ip_address
      t.timestamps
    end
  end
end
