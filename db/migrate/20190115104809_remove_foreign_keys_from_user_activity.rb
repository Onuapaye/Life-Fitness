class RemoveForeignKeysFromUserActivity < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_activities, :user_id, :integer
    remove_column :user_activities, :activity_id, :integer

    add_reference :user_activities, :user, foreign_key: true
    add_reference :user_activities, :activity, foreign_key: true
  end
end
