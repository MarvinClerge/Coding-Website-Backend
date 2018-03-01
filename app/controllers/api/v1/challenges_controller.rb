class Api::V1::ChallengesController < ApplicationController
  def create
    form = params[:form]
    @challenge = Challenge.new(
      user: User.find(params[:user_id]),
      content: form[:content],
      title: form[:title],
      description: form[:description],
      test_value: form[:testValue],
      test_expected: form[:testExpected],
      test_description: form[:testDescription]
    )

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
