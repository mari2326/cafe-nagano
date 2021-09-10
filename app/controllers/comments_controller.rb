class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    Comment.create(comment_params)
    redirect_to post_path(@post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

