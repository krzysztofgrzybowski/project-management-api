class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.owned_projects.order(:name), status: :ok
  end
end
