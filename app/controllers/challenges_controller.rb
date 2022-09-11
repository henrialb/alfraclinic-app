class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show update destroy change_status]

  def all
    @challenges = Challenge.all
    render json: ChallengeBlueprint.render(@challenges)
  end

  def index
    @challenges = Challenge.not_archived
    render json: ChallengeBlueprint.render(@challenges)
  end

  def show
    render json: ChallengeBlueprint.render(@challenge)
  end

  def create
    @challenge = Challenge.create(challenge_params)

    if @challenge
      render json: ChallengeBlueprint.render(@challenge)
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  def update
    if @challenge.update(challenge_params)
      render json: ChallengeBlueprint.render(@challenge)
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @challenge.destroy
      render json: { message: 'Challenge successfully deleted' }, status: :ok
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  def change_status
    @challenge.archived = !@challenge.archived

    if @challenge.save
      render json: ChallengeBlueprint.render(@challenge)
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description, :result_unit, :category)
  end
end
