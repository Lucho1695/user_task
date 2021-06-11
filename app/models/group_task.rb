class GroupTask < ApplicationRecord
  belongs_to :group, class_name: 'Group', optional: true
  belongs_to :task, class_name: 'Task', optional: true

end
