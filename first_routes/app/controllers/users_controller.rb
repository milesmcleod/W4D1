class UsersController < ApplicationController

  def index
    # render plain: "I'm in the index action!"
    @users = User.all
    render json: @users
  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save!
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      @user.save!
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end

  end


  private

  def user_params
    params[:user].permit(:name, :email)
  end

end
