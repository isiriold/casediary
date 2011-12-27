class Letter < ActiveRecord::Base
   belongs_to :user
   validates_presence_of :user_id,:client_id,:regarding,:content

   named_scope :current_law_firm_letters,lambda {|law_firm_id| {:include=>:user,:conditions=>['users.law_firm_id=?',law_firm_id]}}
end
