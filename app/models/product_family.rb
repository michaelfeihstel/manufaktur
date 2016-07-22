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
  has_many :line_items, through: :products

  def self.sold_per_product_family
    group(:id).joins(:line_items).sum("COALESCE(g1, 0) + COALESCE(g1h, 0) + COALESCE(g2, 0) + COALESCE(g2h, 0) + COALESCE(g3, 0) + COALESCE(g3h, 0) + COALESCE(g4, 0) + COALESCE(g4h, 0) + COALESCE(g5, 0) + COALESCE(g5h, 0) + COALESCE(g6, 0) + COALESCE(g6h, 0) + COALESCE(g7, 0) + COALESCE(g7h, 0) + COALESCE(g8, 0) + COALESCE(g8h, 0) + COALESCE(g9, 0) + COALESCE(g9h, 0) + COALESCE(g10, 0) + COALESCE(g10h, 0) + COALESCE(g11, 0) + COALESCE(g11h, 0) + COALESCE(g12, 0) + COALESCE(g12h, 0) + COALESCE(g13, 0) + COALESCE(g13h, 0) + COALESCE(g14, 0) + COALESCE(g14h, 0) + COALESCE(g15, 0) + COALESCE(g16, 0)")
  end
end
