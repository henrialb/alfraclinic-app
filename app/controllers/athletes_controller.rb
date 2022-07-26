class AthletesController < ApplicationController
  before_action :set_athlete, only: %i[show update destroy change_status]

  def all
    @athletes = Athlete.all
    render json: AthleteBlueprint.render(@athletes)
  end

  def index
    @athletes = Athlete.not_archived
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
    if @athlete.destroy
      render json: { message: 'Athlete successfully deleted' }, status: :ok
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  def change_status
    @athlete.archived = !@athlete.archived

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
