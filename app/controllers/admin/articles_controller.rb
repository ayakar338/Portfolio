class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :new]
  def index
    @articles = Article.page(params[:page]).reverse_order
    @favorite = Favorite.find_by(ip: request.remote_ip, article_id: params[:article_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "記事を投稿しました"
      redirect_to admin_articles_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.page(params[:page]).reverse_order
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "内容を変更しました"
      redirect_to admin_article_path
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:alert] = "記事を削除しました"
    redirect_to admin_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :sentence, :image)
  end

end
