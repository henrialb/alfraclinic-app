class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :update, :destroy, :change_status]

  def all
    @athletes = Athlete.all
    render json: AthleteBlueprint.render(@athletes)
  end

  def index
    @athletes = Athlete.active
    render json: AthleteBlueprint.render(@athletes)
  end

  def show
    render json: AthleteBlueprint.render(@athlete)
  end

  def create
    @athlete = Athlete.create(athlete_params)

    if @athlete
      render json: AthleteBlueprint.render(@athlete)
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  def update
    if @athlete.update(athlete_params)
      render json: AthleteBlueprint.render(@athlete)
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @athlete.inactive?
      @athlete.destroy
      render json: { message: 'Athlete was successfully deleted' }, status: :ok
    else
      render json: { message: "You can't delete an active athlete" }, status: :unprocessable_entity
    end
  end

  def change_status
    if @athlete.active?
      @athlete.status = 'inactive'
    else
      @athlete.status = 'active'
    end

    if @athlete.save
      render json: AthleteBlueprint.render(@athlete)
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  private

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end

  def athlete_params
    params.require(:athlete).permit(:name, :date_of_birth, :level)
  end
end
