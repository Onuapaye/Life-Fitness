class RemoveUserTelephoneFromUser < ActiveRecord::Migration[5.2]
  def change
    #remove_column :users, :user_telephone, :integer
    add_column :users, :user_telephone, :string, :limit => 10
  end
end
