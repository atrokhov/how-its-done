class DislikesController < ApplicationController
  before_action :find_post


  def create
    if already_liked_or_disliked?
      flash[:notice] = "You can't like or dislike more than once"
    else
      @author = User.find(@post.user_id)
      @author.karma -= 1
      @author.save!
      @post.dislikes.create!(user_id: current_user.id)
    end

    redirect_to post_path(@post)
  end

  private

  def dislike_params
    params.require(:dislike).permit(:post_id, :user_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked_or_disliked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists? or Dislike.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
