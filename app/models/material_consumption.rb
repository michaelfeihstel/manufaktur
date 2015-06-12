# == Schema Information
#
# Table name: material_consumptions
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  material_id    :integer
#  yield_per_unit :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_material_consumptions_on_material_id  (material_id)
#  index_material_consumptions_on_product_id   (product_id)
#

class MaterialConsumption < ActiveRecord::Base
  belongs_to :product
  belongs_to :material
end
