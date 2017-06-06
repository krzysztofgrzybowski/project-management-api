class ProjectAssignment < ApplicationRecord
  validates :role, presence: true

  belongs_to :project
  belongs_to :user

  enum role: %i(
    admin
    member
    watcher
  )
end
