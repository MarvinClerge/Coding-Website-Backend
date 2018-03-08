class Api::V1::SessionsController < ApplicationController
  def signup
    @user = User.new(username: params[:username], password: params[:password])

    if params[:password] == params[:passwordConfirmation] && @user.save
      @challenges = Challenge.all
      token = issue_token({ 'user_id': @user.id })
      render json: {user: @user, token: token}
    else
      render json: {error: "passwords must match"}
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      @codes = @user.codes
      @challenges = Challenge.all
      token = issue_token({ 'user_id': @user.id })

      render json: {
        user: @user,
        codes: @codes,
        token: token,
        challenges: @challenges
      }

    else
      render json: {error: "username and password do not match"}
    end
  end

  def get_current_user
    @user = current_user
    @challenges = Challenge.all

    if @user
      @codes = @user.codes.sort_by{|code| code.updated_at}.reverse

      if @user
        render json: {user: @user, codes: @codes, challenges: @challenges}
      else
        render json: {error: 'Invalid User Token'}
      end

    else
      # Get the challenges
      render json: {challenges: @challenges}

    end
  end

end
