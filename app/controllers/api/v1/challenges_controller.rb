class Api::V1::ChallengesController < ApplicationController
  def test
    render json: {hello: "world"}
  end
end
