class GroupUser < ApplicationRecord
  belongs_to :group, class_name: 'Group', optional: true
  belongs_to :user, class_name: 'User', optional: true

end
