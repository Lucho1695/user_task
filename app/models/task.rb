class Task < ApplicationRecord
  validates :name, presence: true, length: {maximum: 253, minimum: 2}, uniqueness: { case_sensitive: true }

  has_many :group_task, class_name: 'GroupTask'
  has_many :groups, through: :group_task
  has_many :users, through: :groups

  enum state: {
    "Pendiente": 1,
    "Terminado": 0
  }
end
