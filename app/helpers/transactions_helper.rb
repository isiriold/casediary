module TransactionsHelper

  def find_client_object(transaction_id)
    ct_object = ClientTransaction.find_by_transaction_id(transaction_id)
    client_object = Client.find(ct_object.client_id)
    return client_object
  end

  def firm_expence_accounts(current_user)
    Account.find(:all,:include=>:user,:conditions=>['account_type like ? and users.law_firm_id=?',"Expense",current_user.law_firm_id]).map{|ac| [ac.account_name,ac.id]}
  end

end
