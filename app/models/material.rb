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

class Material < ActiveRecord::Base
  # associations
  has_many :material_properties, dependent: :destroy
  has_many :products, through: :material_consumptions
  has_many :material_consumptions, dependent: :destroy

  accepts_nested_attributes_for :material_properties, allow_destroy: true
  accepts_nested_attributes_for :material_consumptions, allow_destroy: true




  # methods
  def properties_only_name
    material_properties.used_in_name.pluck(:value).join(" / ")
  end

  def full_name
    properties = material_properties.used_in_name.pluck(:value).join(" / ")

    if properties.present?
      name + " (" + properties + ")"
    else
      name
    end
  end
end
