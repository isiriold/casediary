class SavedLetter < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id,:regarding,:content
  named_scope :current_law_firm_saved_letters,lambda {|law_firm_id| {:include=>:user,:conditions=>['users.law_firm_id=?',law_firm_id]}}
end
