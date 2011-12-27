class LawFirm < ActiveRecord::Base
  has_many :users
  has_many :clients
  has_many :cases
  has_many :alerts
  has_many :accounts
  has_many :lawyer_accounts
  has_many :allocations
  validates_presence_of :firm_name
end
