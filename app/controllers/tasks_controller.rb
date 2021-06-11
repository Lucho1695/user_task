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
      render json: "Validate the task params", status: 422

    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description, :state)
  end
end
