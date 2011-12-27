class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :account_id
      t.decimal :amount,:precision => 14, :scale => 2
      t.string :purpose
      t.integer :associated_lawyer
      t.integer :spent_by 
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
