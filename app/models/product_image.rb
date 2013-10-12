# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  default    :boolean
#

class ProductImage < ActiveRecord::Base
  belongs_to :product

  # attr_accessible :product_id, :url, :default


  scope :featured, where(:default => true)
end
