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
#  contact_id   :integer
#
# Indexes
#
#  index_materials_on_contact_id  (contact_id)
#

class Material < ActiveRecord::Base
  # associations
  has_many :material_properties, dependent: :destroy
  has_many :products, through: :material_consumptions
  has_many :material_consumptions, dependent: :destroy
  has_many :series_step_entries, through: :products
  belongs_to :contact

  accepts_nested_attributes_for :material_properties, allow_destroy: true
  accepts_nested_attributes_for :material_consumptions, allow_destroy: true

  # pg_search
  include PgSearch
  multisearchable against: [:name]




  # methods
  def properties
    material_properties.map(&:value).join(" / ")
  end

  def full_name
    properties = material_properties.map(&:value).join(" / ")

    if properties.present?
      name + " (" + properties + ")"
    else
      name
    end
  end

  def consumption(from: '01.01.2010'.to_date, to: Date.today)
    quantities = material_consumptions.map { |i| i.consumption(from: from, to: to) }
    quantities.sum
  end
end
