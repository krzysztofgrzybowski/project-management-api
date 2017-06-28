class ProjectAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_assignment, only: [:update, :destroy]

  def create

  end

  def update

  end

  def destroy

  end

  private

  def set_project_assignment
    @project_assignment = ProjectAssignment.find_by(
                            user_id: params[:user_id],
                            project_id: params[:project_id]
                          )
  end

  def project_assignment_params
    params.require(:project_assignment).permit(
      :user_id,
      :project_id,
      :role
    )
  end
end
