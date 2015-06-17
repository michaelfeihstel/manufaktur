class Tax < ActiveRecord::Base
  has_many :orders
end
