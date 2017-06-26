class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.owned_projects.order(:name), status: :ok
  end

  def create
    project = current_user.owned_projects.new(project_params)
    if project.save
      render json: project, status: :ok
    else
      render json: { errors: project.errors }, status: :unprocessable_rntity
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :name
    )
  end
end
