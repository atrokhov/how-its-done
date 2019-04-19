class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @likes = @post.likes.size
    @dislikes = @post.dislikes.size
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, alert: "Post created!"
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post, alert: "Post updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path, alert: "Post deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :category_id, :subcategory_id, :user_id)
  end
end
