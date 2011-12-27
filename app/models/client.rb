class Client < ActiveRecord::Base
  has_many :cases
  has_many :invoices
  has_many :alerts
  has_many :client_transactions
  has_many :transactions,:through=>:client_transactions
  belongs_to :referer
  belongs_to :law_firm
  
  validates_presence_of :law_firm_id,:name,:client_type
end
