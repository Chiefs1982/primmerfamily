class PagesController < ApplicationController
  respond_to :html, :js

  def home
    @title = "Home"
    @articles = Article.last(4).reverse
    if signed_in?
      @articles.each do |a|
        a[:comment_form] = Comment.new
      end
    end
  end

  def about
    @title = "About"
  end

  def archive
    @title = "Archive"
    @articles = Article.all.reverse
    @pictures = Picture.paginate(:per_page => 9, :page => params[:page])
    @potm = PicOfTheMonth.order("year ASC, month ASC").where("year > #{1}")
  end

  def miles
    @title = "Miles"
    miles = "miles"
    @articles = Article.regex_load('miles').last(4).reverse
    if signed_in?
      @articles.each do |a|
        a.comment_form.build
      end
    end
  end

  def vivian
    @title = "Vivian"
  end

  def family_tree
    @title = "Family Tree"
  end

end
