class Admin::PostsController < ApplicationController
  before_filter :authenticate
  before_filter :adminuser

  def index
    @title = "Admin: All Articles"
    @article = Article.all.reverse
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:success] = "Article Posted!"
      redirect_to admin_post_path(@article.article_id)
    else
      @title = "Admin: New Article"
      flash[:error] = "There was a problem creating article!"
      8.times {@article.pictures.build}
      render 'new'
    end
  end

  def update
    @a = Article.find_by_article_id(params[:id])
    if @a.update_attributes(params[:article])
      flash[:success] = "Article Updated"
      redirect_to admin_root_path
    else
      @title = "Admin: Edit Article"
      flash[:error] = "There was a problem updating the article!"
      render 'edit'
    end
  end

  def new
    @title = "New Article"
    rand_post
    @article = Article.new
    @article.article_id = @num
    8.times {@article.pictures.build}
  end

  def destroy
    @a = Article.find_by_article_id(params[:id])
    if @a.destroy
      flash[:success] = "Article Deleted!"
      redirect_to admin_root_path
    else
      @title = "Admin: All Articles"
      flash[:error] = "There was a problem deleting the article!"
      render 'index'
    end
  end

  def edit
    @title = "Admin: Edit Article"
    @article = Article.find_by_article_id(params[:id])
     8.times {@article.pictures.build}
  end

  def show
    @title = "Admin: Article"
    @article = Article.find_by_article_id(params[:id])
    if signed_in?
        @article[:comment_form] = Comment.new
    end
  end
  
  private

      def rand_post
        begin
          rnum = []
          9.times do
            rnum << rand(0..9)
          end
          @num = rnum.join
          check = Article.find_by_article_id(@num)
        end while !check.nil?
      end

end
