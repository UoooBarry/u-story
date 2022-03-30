class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:green] = 'Article was successfully created.'
      redirect_to @article
    else
      flash[:red] = 'Article was not created.'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end
end
