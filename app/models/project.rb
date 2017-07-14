class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :owner, presence: true

  belongs_to :owner, class_name: "User"
  has_many :project_assignments
  has_many :members, through: :project_assignments, source: :user
end
