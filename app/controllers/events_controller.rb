# app/controllers/events_controller.rb
class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    @event = Event.new
    authorize @event
  end

  def show
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: 'Événement créé avec succès.'
    else
      render :new
    end
    authorize @event
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_path, notice: 'Événement mis à jour avec succès.'
    authorize @event
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Événement supprimé avec succès.'
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, photos_attributes: [:id, :image, :_destroy])
  end
end
