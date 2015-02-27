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

  accepts_nested_attributes_for :material_properties, allow_destroy: true
end
