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

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
