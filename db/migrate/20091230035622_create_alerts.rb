class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.integer :client_id
      t.integer :case_id
      t.integer :user_id
      t.integer :hearing_id
      t.text :alert_text
      t.boolean :display_status
      t.date :display_till
      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
