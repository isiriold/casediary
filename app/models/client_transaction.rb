class ClientTransaction < ActiveRecord::Base
  belongs_to :client
  belongs_to :transaction

  def self.create_row(client_id,transaction_id)
    client_transaction = ClientTransaction.new
    client_transaction.client_id = client_id
    client_transaction.transaction_id = transaction_id
    client_transaction.save
  end
end
