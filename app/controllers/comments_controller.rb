class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create!(comments_params)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
