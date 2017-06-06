class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :owner, presence: true

  belongs_to :owner, class_name: "User"
end
