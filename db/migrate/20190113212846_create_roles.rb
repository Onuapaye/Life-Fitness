class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles, :options => "ENGINE=InnoDB" do |t|
      t.string :role_name, :limit => 45, null: false
      t.text :role_description
      t.boolean :role_status, null: false, default: true

      t.timestamps
    end

    add_index :roles, :role_name, unique: true
  end
end
