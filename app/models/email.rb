class Email < ActiveRecord::Base
  belongs_to :user
  
  named_scope :current_law_firm_emails,lambda {|law_firm_id| {:include=>:user,:conditions=>[' users.law_firm_id=?',law_firm_id]}}
end
