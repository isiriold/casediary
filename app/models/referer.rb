class Referer < ActiveRecord::Base
  has_many :clients
  validates_presence_of :name,:address,:mail
end
