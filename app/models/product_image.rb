# == Schema Information
#
# Table name: product_images
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  default            :boolean
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_product_images_on_product_id  (product_id)
#

class ProductImage < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
  	:styles => {
  		thumb: '100x100>',
  		medium: '400x400>',
  		large: '1200x1200>'
  	},
  	:default_url => "http://placehold.it/500&text=Nothing+here"

  scope :featured, -> { where(default: true) }

end
