class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end

    add_index :group_users, :user_id
    add_index :group_users, [:group_id, :user_id]
  end
end
