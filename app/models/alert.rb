class Alert < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :case
  belongs_to :hearing
  belongs_to :law_firm

  validates_presence_of :user_id,:alert_text,:display_till
end
