class Group < ApplicationRecord
  has_many :group_user, class_name: 'GroupUser'
  has_many :users, through: :group_user

  has_many :group_task, class_name: 'GroupTask'
  has_many :users, through: :group_task
end
