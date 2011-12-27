class User < ActiveRecord::Base
  has_many :cases
  has_many :hearings
  has_many :alerts
  has_many :letters
  has_many :invoices
  has_many :emails
  has_many :messages
  has_many :saved_letters
  has_many :accounts
  has_many :transactions
  has_one :lawyer_account
  has_many :allocations
  belongs_to :law_firm
  
  validates_presence_of :name,:law_firm_id,:role
  acts_as_authentic
end
