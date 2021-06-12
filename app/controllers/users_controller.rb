class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  before_action :set_user, only: [:show]

  def index
    if !current_user.nil?
      @user = User.all
      render json: @user.to_json, status: 200
    else
      render json: "You need authentication", status: 401
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {
        data: user,
        message: { success: "The user has been created" }
      },
      status: 200
    else
      error = JSON.parse(user.errors.to_json).symbolize_keys
      render json: {
        status: 422,
        message: "User can't created",
        error: "#{error}"
      }

    end
  end

  def show
    user = JSON.parse(@user.to_json)
    task = JSON.parse(@user.tasks.to_json)
    group = JSON.parse(@user.groups.to_json)
    render json: {
      data: {
        user: user,
        tasks: task,
        groups: group
      }
    },
    status: 200
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation
    )
  end
end
