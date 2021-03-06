class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.integer :user_id
      t.integer :group_id
    end

    add_index :groups_users, :user_id
    add_index :groups_users, [:group_id, :user_id]
  end
end
