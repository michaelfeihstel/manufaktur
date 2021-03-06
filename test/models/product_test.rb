# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  sku               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  price             :decimal(8, 2)
#  vat               :decimal(, )
#  color_text        :string(255)
#  variation_set_id  :integer
#  fmid              :integer
#  primary_color     :string(255)
#  secondary_color   :string(255)
#  text_color        :string(255)      default("#fff")
#  size_set_id       :integer
#  product_family    :string
#  retail_price      :decimal(8, 2)
#  product_family_id :integer
#
# Indexes
#
#  index_products_on_product_family_id  (product_family_id)
#  index_products_on_size_set_id        (size_set_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
