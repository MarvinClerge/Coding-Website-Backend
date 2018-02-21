class Api::V1::CommentsController < ApplicationController
  def test
    render json: {hello: "world"}
  end
end
