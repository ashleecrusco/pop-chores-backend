class Api::V1::UsersController < ApplicationController
  def index
   users = User.all
   render json: users.to_json(include: [:households, :chores, :user_chores])
 end

  def new
    user = User.new
  end

  def show
    user = User.find(user_params[:id])
    render json: user.to_json(include: [:households, :chores, :user_chores])
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
      render json: user.to_json(include: [:households, :chores, :user_chores])
    else
      render json: {error: 'Invalid User Input', status: '400'}
    end
  end

  def edit
    user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if params[:type] === "edit"

      user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], status: params[:status], username: params[:username])
      render json: {user: user, households: user.households, chores: user.households[0].chores, user_chores: user.user_chores, all_activity: UserChore.all}
    end

    if user_params[:type] === "delete"
      user.delete
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :status, :type, :id)
  end
end
