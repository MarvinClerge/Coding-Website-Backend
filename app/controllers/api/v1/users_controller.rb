class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])

    if @user
      render json: @user
    else
      render json: {error: "Could not find user"}
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: {error: "Unable to create user"}
    end
  end

  def update
    @user = User.find(params[:user_id])
    @user.update(user_params)

    if @user.save
      render json: @user
    else
      render json: {error: "Unable to update user"}
    end
  end

  def destroy
    @user = User.find(params[:user_id])

    if @user.destroy
      render json: {message: "User deleted"}
    else
      render json: {error: "Unable to delete user"}
    end
  end

end
