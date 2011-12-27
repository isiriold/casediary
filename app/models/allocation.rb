class Allocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :law_firm
  validates_presence_of :user_id,:amount,:date_of_allocation,:purpose
  validates_numericality_of :amount
  after_save :update_lawyer_account_current_balance
  
  named_scope :current_law_firm_allocations,lambda { |law_firm_id| {:include=>:user,:conditions=>[' users.law_firm_id=?',law_firm_id ],:order => 'allocations.created_at DESC'}}

  def update_lawyer_account_current_balance
    lawyer_account = self.user.lawyer_account
    lawyer_account.update_attributes(:current_balance=>lawyer_account.current_balance + amount.to_i) unless lawyer_account.blank?
  end
end
