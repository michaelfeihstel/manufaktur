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

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
