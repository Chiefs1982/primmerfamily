class FeedController < ApplicationController
  def index
    @feed = Article.last(10).reverse
    respond_to do |f|
      f.atom {headers["Content-Type"] = 'application/atom+xml; charser=utf-8'}
      f.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently}
    end
  end
end
