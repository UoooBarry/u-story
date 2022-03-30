class CategoriesController < ApplicationController
  def index; end

  def show
    @category = Category.find_by(id: params[:id])
    @articles = @category.articles.includes(:category)

    render 'home/index'
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:green] = 'Category was successfully created.'
      redirect_to root_path
    else
      flash.now[:red] = 'Category was not created.'
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
