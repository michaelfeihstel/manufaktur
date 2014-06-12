# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  sku              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  price            :decimal(8, 2)
#  vat              :decimal(, )
#  color_text       :string(255)
#  variation_set_id :integer
#  size_id          :integer
#  fmid             :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
