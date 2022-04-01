require 'redcarpet/compat'

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destory]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:sky] = 'Article was successfully created.'
      redirect_to @article
    else
      flash[:red] = 'Article was not created.'
      render 'new'
    end
  end

  def show; end

  def update
    flash[:sky] = 'Article was sucessfully updated' if @article.update(article_params)

    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
