class Api::V1::ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
    if @challenges
      render json: @challenges
    else
      render json: {error: "challenges could not be found"}
    end
  end

  def create
    @challenge = Challenge.new(
      title: params[:title],
      description: params[:description],
      test_value: params[:testValue][:value],
      test_value_type: params[:testValue][:type],
      test_expected: params[:testExpected][:value],
      test_expected_type: params[:testExpected][:type],
      test_description: params[:testDescription],
      user_id: params[:user_id]
    )

    if @challenge.save
      render json: @challenge
    else
      render json: {error: "Invalid Entry"}
    end
  end
end
