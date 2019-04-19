class SubcategoriesController < ApplicationController

  def show
    @subcategory = Subcategory.find(params[:id])
    @posts = @subcategory.post.order(created_at: :desc).page(params[:page])
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :description, :category_id)
  end
end
