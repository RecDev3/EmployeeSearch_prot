class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :emproyee_id, { limit: 5, null: false }
      t.string :name, null: false
      t.string :email
      t.string :dept1
      t.string :dept2
      t.string :dept3
      t.string :location_name, null: false
      t.string :location_name_kana
      t.string :address_name
      t.string :address_name_kana
      t.string :position_name, null: false
      t.string :tel_extention, limit: 5
      t.string :tel_outside, limit: 17
      t.string :tel_mobile, limit: 15
      t.timestamps
    end
  end
end
