class Api::V1::HouseholdsController < ApplicationController
  def index
    households = Household.all
    render json: households.to_json(include: [:users, :chores])
  end

  def show
    household = Household.find(params[:id])
    render json: household.to_json(include: [:users, :chores])
  end

  def new
    byebug
  end

  def create
    byebug
  end

  def edit

  end

  def update
  end
end
