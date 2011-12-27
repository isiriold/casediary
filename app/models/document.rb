class Document < ActiveRecord::Base
  belongs_to :case
  validates_presence_of :name,:user_id,:status
end
