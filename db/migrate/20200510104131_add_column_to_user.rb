class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_id, :primary_key
    add_column :users, :emproyee_id, :integer, limit: 5, null: false
    add_column :users, :dept1, :string
    add_column :users, :dept2, :string
    add_column :users, :dept3, :string
  end
end
