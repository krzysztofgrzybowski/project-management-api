class ProjectAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_assignment, only: [:update, :destroy]

  def create
    user = User.find_by(email: params[:email])
    unless user
      user = User.invite!(email: params[:email])
    end
    project_assignment = ProjectAssignment.new(user_id: user.id, project_id: params[:project_id], role: params[:role])
    if project_assignment.save
      render json: project_assignment, status: :ok
    else
      render json: { errors: project_assignment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @project_assignment.update(project_assignment_params)
      render json: @project_assignment, status: :ok
    else
      render json: { errors: @project_assignment.errors }, status: :unprocessable_entity
    end
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
