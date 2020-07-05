class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :admin_users do |t|
      t.index :email, name: "index_staff_members_on_email", unique: true
      t.boolean :admin, default: false, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end

end
