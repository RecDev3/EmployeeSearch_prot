class AddColumnWorkPositionsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :position_name, :string
  end
end
