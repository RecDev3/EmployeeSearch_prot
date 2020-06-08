class AddColumnWorkLocationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location_name, :string, null: false
    add_column :users, :location_name_kana, :string, null: false
    add_column :users, :address_name, :string, null: false
    add_column :users, :address_name_kana, :string, null: false
    add_column :users, :zip_number, :integer, null: false
  end
end
