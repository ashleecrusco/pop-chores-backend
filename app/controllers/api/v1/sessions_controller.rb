class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    token = request.headers['token']
    jwt = JWT.decode(token, "supersecretcode", 'HS256')
    user = User.find(jwt[0]['user_id'])
    render json: user.to_json(include: [:households, :chores, :user_chores])
  end

  def create
    
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: {token: token, user: user, chores: user.chores, households: user.households}
    else
      render json: {error: "ahhhhhhhh!"}
    end
  end

  def issue_token(payload)
    JWT.encode(payload, "supersecretcode", 'HS256')
  end

end
