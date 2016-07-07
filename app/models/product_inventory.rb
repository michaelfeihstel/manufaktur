# == Schema Information
#
# Table name: product_inventories
#
#  id         :integer          not null, primary key
#  year       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductInventory < ApplicationRecord
  has_many :entries, dependent: :nullify, class_name: "ProductInventoryItem"
end
