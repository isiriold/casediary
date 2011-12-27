class CreateLetters < ActiveRecord::Migration
  def self.up
    create_table :letters do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :regarding
      t.text :content
      t.string :cc_to
      t.timestamps
    end
  end

  def self.down
    drop_table :letters
  end
end
