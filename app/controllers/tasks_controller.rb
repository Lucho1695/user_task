class TasksController < ApplicationController
  before_action :authenticate_user

  def create
    task = Task.new(task_params)
    if task.save
      render json: {
        data: task,
        message: { success: "The task has been created" }
      },
      status: 200
    else
      error = JSON.parse(task.errors.to_json).symbolize_keys
      render json: {
        status: 422,
        message: "User can't created",
        error: "#{error}"
      }
    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description, :state)
  end
end
