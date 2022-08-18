class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :update, :destroy]

  def index
    @athletes = Athlete.all.order(:name)
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
    @athlete.destroy
  end

  private

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end

  def athlete_params
    params.require(:athlete).permit(:name, :date_of_birth, :level)
  end
end
