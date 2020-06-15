class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params )
    if @article.save
      flash[:notice] = "Article was created succefully"
      redirect_to @article
    else
    render 'new'
    end
  end

  def update
  if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = "Article deleted" if @article.destroy
    redirect_to articles_path

  end

  private

  def set_article
  @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end


end
