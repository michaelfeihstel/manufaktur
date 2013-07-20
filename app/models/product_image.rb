class ProductImage < ActiveRecord::Base
  belongs_to :product


  scope :featured, where(:default => true)
end
