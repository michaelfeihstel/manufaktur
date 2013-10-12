# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sku        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :decimal(8, 2)
#  vat        :decimal(, )
#  color_text :string(255)
#

class Product < ActiveRecord::Base
  

  has_many :product_images, :dependent => :destroy


  # accepts_nested_attributes_for :product_images


  def default_image
  	if self.product_images.empty?
  		"No image yet"
  	else
  		self.product_images.first.url
	end
  end
  
end
