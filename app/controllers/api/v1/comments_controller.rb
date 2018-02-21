class Api::V1::CommentsController < ApplicationController
  def show
    @challenge = Challenge.find(params[:challenge_id])
    @comments = Comment.where(challenge: @challenge)

    if @comments
      render json: @comments
    else
      render json: {error: "Unable to find comments"}
    end
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @user = User.find(params[:user_id])

    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: {error: "Unable to create comment"}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content,
      :channel,
      :user_id,
      :challenge_id
    )
  end

end
