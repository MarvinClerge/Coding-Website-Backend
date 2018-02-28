class Api::V1::CodesController < ApplicationController
  def save
    @user = User.find(params[:user_id])

    if params[:code_id]
      update
    else
      create
    end
  end

  def create
    @code = Code.new(
      user: @user,
      content: params[:code],
      language: params[:language]
    )

    if @code.save
      render json: {code: @code}
    else
      render json: {error: "Unable to create code"}
    end
  end

  def update
    @code = Code.find(params[:code_id])
    @code.update(content: params[:code])

    if @code.save
      render json: {code: @code}
    else
      render json: {error: "Unable to update code"}
    end
  end

  def destroy
    @code = Code.find(params[:code_id])

    if @code && @code.destroy
      render json: {code_id: params[:code_id], message: "code deleted"}
    else
      render json: {error: "unable to delete code"}
    end
  end

end
