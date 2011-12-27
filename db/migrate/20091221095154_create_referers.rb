class CreateReferers < ActiveRecord::Migration
  def self.up
    create_table :referers do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :mobile_number
      t.string :mail
      t.text :other_details
      t.timestamps
    end
  end

  def self.down
    drop_table :referers
  end
end
