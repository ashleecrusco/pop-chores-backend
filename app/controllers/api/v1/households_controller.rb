class Api::V1::HouseholdsController < ApplicationController
  def index
    households = Household.all
    render json: households.to_json()
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
