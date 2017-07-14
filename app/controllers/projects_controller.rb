class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update, :destroy, :team_members]

  def index
    render json: current_user.owned_projects.order(:name), status: :ok
  end

  def create
    project = current_user.owned_projects.new(project_params)
    if project.save
      render json: project, status: :ok
    else
      render json: { errors: project.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @project, status: :ok
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def team_members
    render json: @project.members
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(
      :name
    )
  end
end
