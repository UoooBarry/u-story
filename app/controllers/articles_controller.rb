require 'redcarpet/compat'

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.all.includes(:category).order(created_at: :desc)
    @articles = @articles.where(category_id: params[:category_id]) if params[:category_id].present?
    @pagy, @articles = pagy(@articles, items: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:blue] = 'Article was successfully created.'
      redirect_to @article
    else
      flash[:red] = 'Article was not created.'
      render 'new'
    end
  end

  def destroy
    if @article.present? && @article.destroy
      flash[:blue] = 'Article successfully deleted'
    else
      flash[:red] = @article&.errors&.full_messages
    end
    redirect_to root_path
  end

  def show; end

  def update
    flash[:blue] = 'Article was sucessfully updated' if @article.update(article_params)

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
