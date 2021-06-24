class Admin::FavoritesController < ApplicationController
  def create
  @article = Article.find(params[:article_id])
  @favorite = Favorite.find_by(ip: request.remote_ip, article_id: params[:article_id])
   if @favorite
        flash[:notice] = "すでにいいねしています"
        redirect_to admin_article_path(@article.id)
   else
     @favorite = Favorite.create(article_id: params[:article_id], ip: request.remote_ip)
     redirect_to admin_article_path(@article.id)
   end
  end
end
