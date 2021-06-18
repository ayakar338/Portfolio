class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      rendee :confirm
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
    @event = Event.new(event_params)
    render :new if @event.invalid?
  end

  private

  def event_params
    params.require(:event).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :number, :plan_day, :start_time, :email, :tel)
  end
end
