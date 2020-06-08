class AddColumnNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name_kana, :string
  end
end
