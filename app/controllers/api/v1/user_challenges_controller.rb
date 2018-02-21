class Api::V1::UserChallengesController < ApplicationController
  def show
    @user_challenges = UserChallenge.where(user_id: params[:user_id])

    if @user_challenges
      render json: @user_challenges
    else
      render json: {error: "Unable to find this user's challenges"}
    end
  end

  def create
    @user = User.find(params[:user_id])
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UserChallenge.new(user: @user, challenge: @challenge, status: params[:status])

    if @user_challenge.save
      render json: @user_challenge
    else
      render json: {error: "Unable to create user challenge association"}
    end
  end

  def update
    @user_challenge = UserChallenge.find(params[:user_challenge_id])
    @user_challenge.update(user_challenge_params)

    if @user_challenge.save
      render json: @user_challenge
    else
      render json: {error: "Unable to update user-challenge status"}
    end
  end

  private

  def user_challenge_params
    params.require(:user_challenge).permit(
      :user_id,
      :challenge_id,
      :status
    )
  end
end
