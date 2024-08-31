# app/controllers/events_controller.rb
class EventsController < ApplicationController
  before_action :set_user

  def index
    @events = @user.events.includes(:photos)
  end

  def show
    @event = @user.events.find(params[:id])
  end

  def new
    @event = @user.events.build
  end

  def create
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to user_events_path(@user), notice: 'Événement créé avec succès.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def event_params
    params.require(:event).permit(:title, photos_attributes: [:id, :image, :_destroy])
  end
end
