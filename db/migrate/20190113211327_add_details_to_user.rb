class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_first_name, :string, null: false, :limit => 45
    add_column :users, :user_last_name, :string, null: false, :limit => 45
    add_column :users, :user_age, :integer, null: false
    add_column :users, :user_status, :boolean, null: false, defaul: true
    add_column :users, :user_telephone, :integer, null:true
    add_belongs_to :users, :role, index: true
  end
end
