class LawyerAccount < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id,:opening_balance
  validates_numericality_of :opening_balance
  validates_uniqueness_of :user_id,:message=>'This lawyer already have an account'

  named_scope :current_law_firm_lawyer_accounts,lambda { |law_firm_id| {:include=>:user,:conditions=>[' users.law_firm_id=?',law_firm_id ],:order => 'lawyer_accounts.created_at DESC'}}
 end
