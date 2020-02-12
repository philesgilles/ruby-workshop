class ArticlesController < ApplicationController
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    #flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private

  def require_same_user
    @article = Article.find(params[:id])
    if current_user != @article.user
      flash[:danger] = "You need the be the user of article to edit"
      redirect_to root_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, category_ids: [])
  end
end
