class Api::V1::UserChallengesController < ApplicationController
  def test
    render json: {hello: "world"}
  end
end
