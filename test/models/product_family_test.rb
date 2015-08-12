# == Schema Information
#
# Table name: product_families
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class ProductFamilyTest < ActiveSupport::TestCase

  def product_family
    @product_family ||= ProductFamily.new
  end

  def test_valid
    assert product_family.valid?
  end

end
