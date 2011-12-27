class Spender < ActiveRecord::Base
  has_one :transaction
end
