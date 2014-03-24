class Counter < ActiveRecord::Base
  attr_accessible :hit_counter, :session_hash, :ip_address
end
