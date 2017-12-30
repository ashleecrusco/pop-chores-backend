class Api::V1::ChoresController < ApplicationController
  def index
    chores = Chore.all
    render json: {chores: chores}
  end

  def new
    chore = Chore.new
  end

  def show
    chore = Chore.find(params[:id])
    render json: chore.to_json(include: [:user_chores])
  end

  def create
    byebug
    chore = Chore.new(chore_params)
    user = User.find()
    if chore.valid?
      chore.save
      render json: {user: user, households: user.households, chores: user.households[0].chores, user_chores: user.user_chores, all_activity: UserChore.all}
    else
      render json: {error: 'Invalid Input', status: '400'}
    end
  end

  def update

    # if complete
    if chore_update_params[:type] === "complete"
      chore = Chore.find(chore_update_params[:chore_id])
      user = User.find(chore_update_params[:user_id])

      user_chore = UserChore.find(chore_update_params[:id])
      # mark user_chore as complete with date
      t = Time.now
      time = t.strftime("%m/%d/%y at %I:%M%p")
      
      user_chore.update_attributes(complete: true, personal_chore: chore.personal_chore, points: chore.point_value, title: chore.title, image_url: chore.image_url, date_completed: time, completed_at: Time.now)
      # change chore to available
      chore.update_attributes(available: true)
      # add points to user points
      user.update_attributes(points: user.points += chore.point_value)
    end

    # if add
    if chore_update_params[:type] === "add"
      chore = Chore.find(chore_update_params[:id])
      user = User.find(chore_update_params[:user_id])

      # change chore to unavailable
      chore.update_attributes(available: false)
      # add chore to user_chores
      user.chores << chore
      user.user_chores.last.update_attributes(personal_chore: chore.personal_chore, points: chore.point_value, title: chore.title, image_url: chore.image_url)
    end

    # if like
    if chore_update_params[:type] === "like"
      user = User.find(chore_update_params[:user_id])
      user_chore = UserChore.find(chore_update_params[:id])
      user_chore.update_attributes(likes: user_chore.likes += 1)
    end
    render json: {user: user, households: user.households, chores: user.households[0].chores, user_chores: user.user_chores, all_activity: UserChore.all}
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :point_value, :description, :image_url, :household_id, :available, :chore_owner, :personal_chore)
  end

  def chore_update_params
    params.permit(:id, :title, :point_value, :available, :image_url, :user_id, :type, :complete, :chore_id, :date_completed)
  end
end
