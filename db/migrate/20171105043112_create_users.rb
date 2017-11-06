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

    # Create an admin user
    password = "AdminP@ssw0rd"
    admin_user = User.create(
      :name => 'Admin user',
      :username => 'admin',
      :email => 'adminemail@adminemail.com',
      :password => password, :password_confirmation => password,
      :admin => true)
    admin_user.save
  end
end
