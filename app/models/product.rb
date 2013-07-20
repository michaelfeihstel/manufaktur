class Product < ActiveRecord::Base
  

  has_many :product_images, :dependent => :destroy


  accepts_nested_attributes_for :product_images


  def default_image
  	@default_image = Product.product_images.where(:default => true)
	@default_image.first
  end
end