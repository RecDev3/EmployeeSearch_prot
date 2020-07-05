class AddIndexNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:name, :name_kana]
  end
end
