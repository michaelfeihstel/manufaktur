# == Schema Information
#
# Table name: return_line_items
#
#  id         :integer          not null, primary key
#  return_id  :integer
#  product_id :integer
#  g1         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_return_line_items_on_product_id  (product_id)
#  index_return_line_items_on_return_id   (return_id)
#

class ReturnLineItem < ApplicationRecord
  belongs_to :return
  belongs_to :product
end
