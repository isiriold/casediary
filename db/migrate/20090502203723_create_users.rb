class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :law_firm_id
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :mobile_number
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :role
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
