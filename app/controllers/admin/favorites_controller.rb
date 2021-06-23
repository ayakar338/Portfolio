class Admin::FavoritesController < ApplicationController
  def create
  @article = Article.find(params[:article_id])
  @favorite = Favorite.find_by(ip: request.remote_ip, article_id: params[:article_id])
   if @favorite
        flash[:notice] = "すでにいいねしています"
   else
     @favorite = Favorite.create(article_id: params[:article_id], ip: request.remote_ip)
   end
  end
end
