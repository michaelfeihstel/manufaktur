class ProductFamily < ActiveRecord::Base
  # Associations
  has_many :products
end
