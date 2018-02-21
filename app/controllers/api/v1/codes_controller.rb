class Api::V1::CodesController < ApplicationController
  def test
    render json: {hello: "world"}
  end
end
