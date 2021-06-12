class GroupsController < ApplicationController
  before_action :authenticate_user
  before_action :set_group, only: [:update, :destroy]

  def create
    group = Group.new(group_params)
    if group.save
      render json: {
        data: group,
        message: { success: "The group has been created" }
      },
      status: 200
    else
      error = JSON.parse(group.errors.to_json).symbolize_keys
      render json: {
        status: 422,
        message: "Group can't created",
        error: "#{error}"
      }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, user_ids: [], task_ids: [])
  end
end
