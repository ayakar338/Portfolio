class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
     if params[:back]
       render :new
     else @event.save!
       redirect_to @event
     end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:alert] = "予約を取り消しました"
    redirect_to events_path
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
