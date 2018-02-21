class Api::V1::CodesController < ApplicationController
  def show
    @code = Code.find(params[:code_id])

    if @code
      render json: @code
    else
      render json: {error: "Could not find code"}
    end
  end

  def create
    @user = User.find(params[:user_id])
    @code = Code.new(code_params)

    if @code.save
      render json: @code
    else
      render json: {error: "Unable to create code"}
    end
  end

  def update
    @code = Code.find(params[:code_id])
    @code.update(code_params)

    if @code.save
      render json: @code
    else
      render json: {error: "Unable to update code", errors: @code.errors}
    end
  end

  def destroy
    @code = Code.find(params[:code_id])

    if @code.destroy
      render json: {message: "Code deleted"}
    else
      render json: {error: "Unable to delete code"}
    end
  end

  private

  def code_params
    params.require(:code).permit(
      :content,
      :language,
      :user_id,
      :challenge_id
    )
  end
end
