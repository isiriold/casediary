class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :user_id
      t.string :account_name
      t.string :account_type
      t.decimal :opening_balance,:precision => 14, :scale => 2
      t.decimal :current_balance,:precision => 14, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
