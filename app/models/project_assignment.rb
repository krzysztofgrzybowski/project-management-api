class ProjectAssignment < ApplicationRecord
  validates :role, presence: true
  validate :uniqness_of_assignment

  belongs_to :project
  belongs_to :user

  enum role: %i(
    admin
    member
    watcher
  )

  def uniqness_of_assignment
    if ProjectAssignment.exists?(user_id: user_id, project_id: project_id)
      errors.add('', 'user is already assigned to this project')
    end
  end
end
