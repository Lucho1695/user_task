class User < ApplicationRecord
  has_secure_password

  validates_presence_of   :email
  validates_presence_of   :name
  validates_uniqueness_of :email

  has_many :group_users, class_name: 'GroupsUsers'
  has_many :groups, through: :group_users
  has_many :tasks, through: :groups
end
