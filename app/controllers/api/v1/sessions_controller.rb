class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    jwt = JWT.decode(params[:token], "supersecretcode", 'HS256')
    token = request.headers['Authorization']
    byebug
    user = User.find(jwt[0]["user_id"])
    render json: {
      id: user.id,
      username: user.username,
      user_info: user
    }
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: {token: token, user: user}
    else
      render json: {error: "ahhhhhhhh!"}
    end
  end

  def issue_token(payload)
    JWT.encode(payload, "supersecretcode", 'HS256')
  end

end
