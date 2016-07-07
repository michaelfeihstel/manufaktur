# == Schema Information
#
# Table name: product_families
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductFamily < ApplicationRecord
  # Associations
  has_many :products, dependent: :nullify
end
