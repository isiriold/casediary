class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :subject
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
