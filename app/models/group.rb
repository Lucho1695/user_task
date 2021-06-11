class Group < ApplicationRecord
  validates :name, presence: true, length: {maximum: 253, minimum: 2}, uniqueness: { case_sensitive: true }
  has_many :groups_users, class_name: 'GroupsUsers'
  has_many :users, through: :groups_users


  has_many :group_task, class_name: 'GroupTask'
  has_many :tasks, through: :group_task
end
