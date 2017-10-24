class CommentsController < ApplicationController

  def index
    if params[:user_id] #=> comment_params[:author_id]
      @comments = User.find(params[:user_id]).comments
      if @comments
        render json: @comments
      else
        render json: @comments.errors.full_messages, status: 404
      end

    elsif params[:artwork_id]
      @comments = Artwork.find(params[:artwork_id]).comments
      if @comments
        render json: @comments
      else
        render json: @comments.errors.full_messages, status: 404
      end

    else
      render plain: "Comment not found", status: 404
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment
      @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 404
    end
  end

  private

  def comment_params
    params[:comment].permit(:author_id, :artwork_id, :body)
  end

end
