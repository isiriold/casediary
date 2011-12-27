class Case < ActiveRecord::Base
  include AASM
  has_many :hearings
  has_many :alerts
  has_many :documents
  belongs_to :user
  belongs_to :client
  belongs_to :law_firm
  
  validates_presence_of :user_id,:client_id,:case_type,:file_number


   #--------------------------aasm------------------------------------#
  aasm_column :status
  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :dismissed
  aasm_state :submitted
  aasm_state :judgement
     

  aasm_event :dismissed_status do
    transitions :to => :dismissed, :from => [:pending]
  end
  
  aasm_event :submitted_status do
    transitions :to => :submitted, :from => [:pending]
  end

  aasm_event :judgement_status do
    transitions :to => :judgement, :from => [:submitted]
  end

 #---------------------------------------------------------------#

  def change_status(value)
    command = value
      case command
         when "Submit"
           if self.status != "Submit"
             self.submitted_status!
           end  
         when "Dismiss"
           if self.status != "dismissed"
             self.dismissed_status!
           end
         when "Judgement"
           if self.status != "judgement"
             self.judgement_status!
           end
      end
  end

end
