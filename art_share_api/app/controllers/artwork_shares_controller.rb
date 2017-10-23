class ArtworkSharesController < ApplicationController
  def create
    @new_share = ArtworkShare.new(artwork_shares_params)
    if @new_share.save
      render json: @new_share
    else
      render json: @new_share.errors.full_messages, status: 422
    end

  end

  def destroy
    @new_share = ArtworkShare.find(params[:id])
    if @new_share
      @new_share.destroy
      render json: @new_share
    else
      render json: @new_share.errors.full_messages, status: 404
    end
  end

  def index
    @shares = ArtworkShare.all
    render json: @shares
  end
  private

  def artwork_shares_params
    params[:artwork_share].permit(:artwork_id, :viewer_id)
  end
end
