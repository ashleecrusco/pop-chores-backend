class Api::V1::UserChoresController < ApplicationController
  def index
    user_chores = UserChore.where(user_id: params[:id])
    render json: user_chores.to_json()
  end

  def show
    user_chore = UserChore.find(params[:id])
    render json: user_chore.to_json()
  end

  def create
    byebug
  end
end
