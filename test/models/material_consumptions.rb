# == Schema Information
#
# Table name: products_materials
#
#  id            :integer          not null, primary key
#  product_id    :integer
#  material_id   :integer
#  pair_per_unit :decimal(2, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class MaterialConsumptionTest < ActiveSupport::TestCase

  def products_material
    @material_consumption ||= MaterialConsumption.new
  end

  def test_valid
    assert material_consumption.valid?
  end

end
