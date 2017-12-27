class Api::V1::ChoresController < ApplicationController
  def index
    chores = Chore.all
    render json: chores.to_json(include: [:household, :users,  :user_chores])
  end

  def new
    chore = Chore.new
  end

  def show
    household = Household.find(params[:id])
    chores = household.chores
    render json: chores.to_json(include: [:household, :users,  :user_chores])
  end

  def create
    chore = Chore.new(chore_params)
    if chore.valid?
      chore.save
      chores = Household.find_by(id: chore.household_id).chores
      render json: chores.to_json(include: [:household, :users, :user_chores])
    else
      render json: {error: 'Invalid Input', status: '400'}
    end
  end

  def update
    chore = Chore.find(chore_update_params[:id])
    user = User.find(chore_update_params[:user_id])
    user.chores
    byebug
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :point_value, :description, :image_url, :household_id, :available)
  end

  def chore_update_params
    params.permit(:id, :title, :point_value, :description, :household_id, :available, :image_url, :user_id)
  end
end
