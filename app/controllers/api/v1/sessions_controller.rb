class Api::V1::SessionsController < ApplicationController
  def signup
    @user = User.new(username: params[:username], password: params[:password])
    if params[:password] == params[:passwordConfirmation] && @user.save
      render json: @user
    else
      render json: {error: "passwords must match"}
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {error: "username and password do not match"}
    end
  end
end
