class Api::V1::UsersController < ApplicationController
  def index
   users = User.all
   render json: users.to_json(include: [:households])
 end

  def new
  end

  def create
  end

  def edit

  end

  def update
    byebug
  end
end
