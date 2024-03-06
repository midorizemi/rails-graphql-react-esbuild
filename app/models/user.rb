class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :project_members
  has_many :projects, through: :project_members

  def admin?
   true # /本当は権限系の処理が入る
  end
end
