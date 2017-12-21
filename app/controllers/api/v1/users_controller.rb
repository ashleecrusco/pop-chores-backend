class Api::V1::UsersController < ApplicationController
  def index
   users = User.all
   render json: users.to_json(include: [:households, :chores])
 end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if params[:household_action] === "Join"
      user.households << Household.find(params[:household_id])
    else
      household = Household.create(name: params[:household])
      user.households << household
    end
    if user.valid?
      user.save
      render json: user.to_json(include: [:households, :chores])
    else
      render json: {error: 'Invalid User Input', status: '400'}
    end
  end

  def edit

  end

  def update
    byebug
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password)
  end
end
