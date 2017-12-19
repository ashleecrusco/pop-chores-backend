class Api::V1::HouseholdsController < ApplicationController
  def index
    households = Household.all
    render json: households.to_json()
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
  end
end
