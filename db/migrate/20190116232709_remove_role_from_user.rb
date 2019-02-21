class RemoveRoleFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role_id, :integer

    add_reference :users, :role, foreign_key: true
  end
end
