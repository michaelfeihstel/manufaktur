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

class MaterialProperty < ApplicationRecord
  # associations
  belongs_to :material

  # scopes
  scope :used_in_name, -> { where(use_in_name: true) }
end
