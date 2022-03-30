class CategoriesController < ApplicationController
  def index; end

  def show
    @category = Category.find_by(id: params[:id])
    @articles = @category.articles.includes(:category)

    render 'home/index'
  end
end
