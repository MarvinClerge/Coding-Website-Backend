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
      token = issue_token({ 'user_id': @user.id })
      render json: {user: @user, token: token}
    else
      render json: {error: "username and password do not match"}
    end
  end

  def get_current_user
    @user = current_user

    if @user
      render json: @user
    else
      render json: {error: 'No user found'}
    end
  end

end
