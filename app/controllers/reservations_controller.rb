class ReservationsController < ApplicationController
  def index
     @events = Event.all
  end

  def new
    @ecent = Event.new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
