class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :project_members
  has_many :users, through: :project_members
  has_many :tasks, dependent: :destroy
end
