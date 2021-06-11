class CreateGroupTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :group_tasks do |t|
      t.integer :task_id
      t.integer :group_id

      t.timestamps
    end

    add_index :group_tasks, :task_id
    add_index :group_tasks, [:group_id, :task_id]
  end
end
