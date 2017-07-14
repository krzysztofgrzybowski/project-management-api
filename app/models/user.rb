class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :owned_projects, class_name: "Project", foreign_key: "owner_id"
  has_many :assigned_projects, through: :project_assignments, source: :project
end
