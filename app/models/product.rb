# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  sku              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  price            :decimal(8, 2)
#  vat              :decimal(, )
#  color_text       :string(255)
#  variation_set_id :integer
#

class Product < ActiveRecord::Base
  
  has_many :product_images, :dependent => :destroy
  belongs_to :variation_set

  validates	:name,	presence: true
  validates	:sku,		presence: true

  accepts_nested_attributes_for :product_images, :allow_destroy => true

  def default_image
    if self.product_images.empty?
      "http://placehold.it/350&text=Nothing+here"
    else
      self.product_images.first.image.url(:medium)
    end
  end
  
end
