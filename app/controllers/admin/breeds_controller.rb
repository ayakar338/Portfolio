class Admin::BreedsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :new]
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  def index
    @breed_all = Breed.all.page(params[:page]).per(10)
    @breeds = params[:genre_id].present? ? Genre.find(params[:genre_id]).breeds : Breed.all
  end

  def new
    @breed = Breed.new
  end

  def create
    @genres = Genre.all
    @breed = Breed.new(breed_params)
    if @breed.save
      flash[:notice] = "品種を登録しました"
      redirect_to admin_breeds_path
    else
      render :new
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end

  def edit
    @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      flash[:notice] = "内容を変更しました"
      redirect_to admin_breed_path(@breed)
    else
      render :edit
    end
  end

  def destroy
      breed = Breed.find(params[:id])
      breed.destroy
      flash[:alert] = "品種を削除しました"
      redirect_to admin_breeds_path
  end

  private

  def breed_params
    params.require(:breed).permit(:title, :sentence, :genre_id, :image)
  end

  def set_genres
    @genres = Genre.all
  end
end
