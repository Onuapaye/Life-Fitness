class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities, :options => "ENGINE=InnoDB" do |t|
      t.belongs_to :user, index: true , null: false
      t.belongs_to :activity, index: true, null: false
      t.datetime :user_activity_date, null: false
      t.time :user_activity_start, null: false
      t.time :user_activity_end, null: false
      t.text :user_activity_note, null: false

      t.timestamps
    end
  end
end
