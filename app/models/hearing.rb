class Hearing < ActiveRecord::Base
  has_many :alerts
  belongs_to :case
  belongs_to :user
  validates_presence_of :case_id,:user_id,:court_hall,:hearing_date,:next_hearing_date,:highlights_of_the_hearing

 named_scope :current_law_firm_hearings,lambda {|law_firm_id| {:include=>:user,:conditions=>['users.law_firm_id=?',law_firm_id]}}

end
