class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to @subcategory, alert: "Subcategory created!"
    else
      render 'new'
    end
  end

  def update
    @subcategory = Subcategory.find(params[:id])
 
    if @subcategory.update(subcategory_params)
      redirect_to @subcategory, alert: "Subcategory updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy
 
    redirect_to subcategories_path, alert: "Subcategory deleted!"
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :description, :category_id)
  end
end
