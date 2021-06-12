class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: {maximum: 253, minimum: 2}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: { case_sensitive: true }

  validates_uniqueness_of :email

  has_many :group_users, class_name: 'GroupsUsers'
  has_many :groups, through: :group_users
  has_many :tasks, through: :groups
end
