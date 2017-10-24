class ArtworksController < ApplicationController

  def index
    @owned_artworks = User.find(params[:user_id]).artworks
    @shared_artworks = User.find(params[:user_id]).shared_artworks
    render json: @owned_artworks + @shared_artworks
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork
      @artwork.update(artwork_params)
      @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork
      @artwork.destroy
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  private

  def artwork_params
    params[:artwork].permit(:title, :image_url, :artist_id)
  end

end
