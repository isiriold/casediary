class Invoice < ActiveRecord::Base
  belongs_to :client  
  belongs_to :user
  belongs_to :account

  validates_presence_of :invoice_number,:client_id,:account_id,:invoice_amount,:towards
  after_create :update_current_balance

  named_scope :current_user_invoices, lambda{|current_user_id| {:conditions=>['user_id=?',current_user_id],:order => 'created_at DESC'}}

 
  def self.current_law_firm_invoices(user_id,law_firm_id)
    self.find(:all,:include=>[:user],:conditions=>['user_id=? and users.law_firm_id=?',user_id,law_firm_id],:order => 'invoices.created_at DESC')
  end

  def update_current_balance
    Account.update_current_balance(account_id, invoice_amount)
  end
end
