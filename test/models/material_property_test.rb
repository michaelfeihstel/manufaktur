# == Schema Information
#
# Table name: material_properties
#
#  id          :integer          not null, primary key
#  material_id :integer
#  name        :string
#  value       :string
#  use_in_name :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_material_properties_on_material_id  (material_id)
#  index_material_properties_on_use_in_name  (use_in_name)
#

require "test_helper"

class MaterialPropertyTest < ActiveSupport::TestCase

  def material_property
    @material_property ||= MaterialProperty.new
  end

  def test_valid
    assert material_property.valid?
  end

end
