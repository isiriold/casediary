class CreateClientTransactions < ActiveRecord::Migration
  def self.up
    create_table :client_transactions do |t|
      t.column :client_id,:integer
      t.column :transaction_id,:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :client_transactions
  end
end
