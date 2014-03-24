class CommentsController < ApplicationController
  before_filter :signed_in?
  before_filter :correct_comment_user, :only => :destroy

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem saving!"
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment Deleted!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem deleting comment!"
      redirect_to root_path
    end
  end

  private

      def correct_comment_user
        comment_id = Comment.find(params[:id])
        @user = User.find_by_user_id(comment_id.user_id)
        unless current_user?(@user) || super_user
          redirect_to(root_path)
        end
      end
end
