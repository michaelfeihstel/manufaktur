# == Schema Information
#
# Table name: materials
#
#  id           :integer          not null, primary key
#  name         :string
#  supplier_sku :string
#  unit         :string
#  price        :decimal(8, 2)
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class MaterialTest < ActiveSupport::TestCase

  def material
    @material ||= Material.new
  end

  def test_valid
    assert material.valid?
  end

end
