class ArticlesController < ApplicationController

  def show
    if params[:id].to_i < 100000
      @article = Article.find(params[:id])
    elsif params[:id].to_i > 100000
      @article = Article.find_by_article_id(params[:id])
    end
    @title = @article.article_header
    if signed_in?
        @article[:comment_form] = Comment.new
    end
  end

  
end
