class Api::V1::ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:challenge_id])

    if @challenge
      render json: @challenge
    else
      render json: {error: "Could not find challenge"}
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      render json: @challenge
    else
      render json: {error: "Unable to create challenge"}
    end
  end

  def update
    @challenge = Challenge.find(params[:challenge_id])
    @challenge.update(challenge_params)

    if @challenge.save
      render json: @challenge
    else
      render json: {error: "Unable to update challenge", errors: @challenge.errors}
    end
  end

  def destroy
    @challenge = Challenge.find(params[:challenge_id])

    if @challenge.destroy
      render json: {message: "Challenge deleted"}
    else
      render json: {error: "Unable to delete challenge"}
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(
      :content,
      :test,
      :language,
      :description,
      :level,
      :category,
      :level
    )
  end
end
