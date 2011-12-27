class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  has_many :client_transactions
  has_many :clients,:through=>:client_transactions
  belongs_to :spender,
           :class_name => "User" ,
           :foreign_key => "spender_id"

  validates_presence_of :user_id,:account_id,:amount,:purpose
  validates_numericality_of :amount

  after_save :update_lawyer_account_current_balance
  after_create :update_current_balance

  named_scope :current_law_firm_transactions, lambda { |law_firm_id| {:include=>:user,:conditions=>[' users.law_firm_id=?',law_firm_id ],:order => 'transactions.created_at DESC'}}
 
  named_scope :current_user_transactions,lambda{|current_user_id| {:conditions=>['user_id=?',current_user_id],:order => 'created_at DESC'}}

  def update_lawyer_account_current_balance
     lawyer_account = self.spender.lawyer_account
     lawyer_account.update_attributes(:current_balance=>lawyer_account.current_balance - amount.to_i) unless lawyer_account.blank?
  end
  
  def update_current_balance
    Account.update_current_balance(account_id, amount)
  end

end
