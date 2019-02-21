class CreateActivities < ActiveRecord::Migration[5.2]
  def change
     create_table :activities, :options => "ENGINE=InnoDB" do |t|
      t.string :activity_name, :limit => 45, null: false, unique: true
      t.text :activity_description, null: false
      t.time :activity_min_duration, null: false
      t.time :activity_max_duration, null: false

      t.timestamps
    end

    add_index :activities, :activity_name, unique: true
  end
end
