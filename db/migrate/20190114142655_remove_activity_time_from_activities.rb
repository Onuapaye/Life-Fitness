class RemoveActivityTimeFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :activity_min_duration, :time
    remove_column :activities, :activity_max_duration, :time

    add_column :activities, :activity_min_duration, :string, :limit => 8, null: false
    add_column :activities, :activity_max_duration, :string, :limit => 8, null: false
  end
end
