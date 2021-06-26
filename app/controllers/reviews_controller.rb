class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @review =Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "評価しました"
      redirect_to reviews_path(@review)
    else
      redirect_to reviews_path
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:text, :rate)
  end
end
