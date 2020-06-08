class AddColumnContactsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tel_outside, :integer, presence: true, limit: 8
    add_column :users, :tel_extention, :integer, limit: 5
    add_column :users, :tel_mobile, :integer, limit: 15
end
end
