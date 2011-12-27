class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :client_id
      t.integer :account_id
      t.integer :invoice_number
      t.float :invoice_amount,:precision => 14, :scale => 2
      t.text :towards
      t.boolean :payment_received
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
