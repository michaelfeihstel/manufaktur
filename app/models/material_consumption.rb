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

class MaterialConsumption < ApplicationRecord
  belongs_to :product
  belongs_to :material

  def consumption(from: '01.01.2010'.to_date, to: Date.today)
    manufactured_quantity = product.series_step_entries.completed_between(from, to).to_a.sum(&:total)

    manufactured_quantity / yield_per_unit
  end
end
