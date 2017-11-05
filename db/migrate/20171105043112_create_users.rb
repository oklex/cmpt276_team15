class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
