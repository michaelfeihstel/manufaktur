require "test_helper"

class ProductFamilyTest < ActiveSupport::TestCase

  def product_family
    @product_family ||= ProductFamily.new
  end

  def test_valid
    assert product_family.valid?
  end

end
