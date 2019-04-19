class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.post.order(created_at: :desc).page(params[:page])
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
