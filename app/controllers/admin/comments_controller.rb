class Admin::CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to admin_article_path(@article)
    else
      @comments = @article.comments.page(params[:page]).reverse_order
      render template: "admin/articles/show"

    end
  end

  def destroy
    Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_to admin_article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

end
