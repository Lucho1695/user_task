class GroupsUsers < ApplicationRecord
  belongs_to :group, class_name: 'Group', optional: true
  belongs_to :user, class_name: 'User', optional: true

  accepts_nested_attributes_for :user, :allow_destroy => true
end
