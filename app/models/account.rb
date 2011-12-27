class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :law_firm
  belongs_to :account
  has_many :transactions

  validates_presence_of :user_id,:account_type,:opening_balance,:account_name
  validates_numericality_of :opening_balance

  named_scope :current_law_firm_accounts,lambda {|law_firm_id| {:include=>:user,:conditions=>['users.law_firm_id=?',law_firm_id]}}

  def self.update_current_balance(account_id,amount)
     account_obj = Account.find(account_id)
     account_obj.update_attribute('current_balance', account_obj.current_balance + amount.to_i)
  end

  
end
