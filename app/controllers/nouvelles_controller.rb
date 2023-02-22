class NouvellesController < ApplicationController
  before_action :set_nouvelle, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @nouvelles = policy_scope(Nouvelle).order(created_at: :desc)
    @nouvelle = Nouvelle.new
    authorize @nouvelle
  end

  def new
    @nouvelle = Nouvelle.new
    authorize @nouvelle
  end

  def create
    @nouvelle = Nouvelle.new(nouvelle_params)
    @nouvelle.user = current_user
    if @nouvelle.save
      redirect_to root_path
    else
      render :new
    end
    authorize @nouvelle
  end

  def update
    @nouvelle.update(nouvelle_params)
    redirect_to root_path
    authorize @nouvelle
  end

  def destroy
    @nouvelle.destroy
    redirect_to root_path
    authorize @nouvelle
  end

  private

  def set_nouvelle
    @nouvelle = Nouvelle.find(params[:id])
  end

  def nouvelle_params
    params.require(:nouvelle).permit(:comment, :user, :content)
  end
end
