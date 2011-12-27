class CreateSavedLetters < ActiveRecord::Migration
  def self.up
    create_table :saved_letters do |t|
      t.integer :user_id
      t.string :regarding
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :saved_letters
  end
end
