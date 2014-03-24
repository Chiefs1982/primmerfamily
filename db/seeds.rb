# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if PicOfTheMonth.where(month: 1, year: 1).blank?
  PicOfTheMonth.create!(:picmonth_file_name => "2013MilesAtPark1228-12.jpg",:picmonth_content_type => "image/jpeg",:picmonth_file_size => "1210373",:picmonth_updated_at => "2014-3-7 19:01:06", :month => 1, :year => 1, :title => "Picture of the Month")
end