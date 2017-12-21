class Api::V1::ChoresController < ApplicationController
  def index
    chores = Chore.all
    render json: chores.to_json(include: [:household])
  end

  def new
    chore = Chore.new
  end

  def show
    household = Household.find(params[:id])
    chores = household.chores
    render json: chores.to_json()
  end

  def create
    chore = Chore.new(chore_params)
    if chore.valid?
      chore.save
      chores = Household.find_by(id: chore.household_id).chores
      render json: chores.to_json(include: [:household])
    else
      render json: {error: 'Invalid Input', status: '400'}
    end
  end

  def edit

  end

  def update
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :point_value, :description, :image_url, :household_id, :available)
  end
end
