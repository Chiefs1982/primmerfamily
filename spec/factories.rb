Factory.define :pic_of_the_month do |pic|
  pic.picmonth_file_name       "2013MilesAtPark1228-12.jpg"
  pic.picmonth_content_type    "image/jpeg"
  pic.picmonth_file_size       "1210373"
  pic.picmonth_updated_at      "2014-3-7 19:01:06"
  pic.month                    1
  pic.year                     1
  pic.title                    "Picture of the Month"
end

Factory.define :counter do |counter|
  counter.hit_counter      1217
  counter.session_hash     "65b0a2314f99eae4d4c25b17ddec7b99"
  counter.ip_address       "127.0.0.1"
end

Factory.define :article do |article|
  article.article_header       "This is the header"
  article.article_body         "This is the body"
  article.article_id           965486167
  article.article_link         "Article Link"
  article.article_pics         false
  article.article_video        false
  article.top_pics             false
  article.article_tags         "tags" 
end

Factory.define :user do |user|
  user.firstname              "Aaron"
  user.lastname               "Primmer"
  user.username               "aaronmprimmer"
  user.email                  "aaronmprimmer@hotmail.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
  user.user_id                1000001
  user.newsletter             true
  user.admin                  true
  user.super_user             true
end

#:picmonth_file_name => "2013MilesAtPark1228-12.jpg",:picmonth_content_type => "image/jpeg",:picmonth_file_size => "1210373",:picmonth_updated_at => "2014-3-7 19:01:06", :month => 1, :year => 1, :title => "Picture of the Month"