class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
      t.string :comp_name, :limit => 100, null: false, unique: true
      t.string :comp_telephone, limit: 15, null: false
      t.string :comp_mobile, limit: 15
      t.text   :comp_about_us, null: false
      t.string :comp_coordinate_long, null: false
      t.string :comp_coordinate_lat, null: false
      t.string :comp_address_l1, null: false
      t.string :comp_address_l2
      t.string :comp_postal_code
      t.string :comp_country_name, null: false
      t.string :comp_city_name, null: false

      t.timestamps
    end

    add_index :companies, :comp_name, unique: true
  end
end
