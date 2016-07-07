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

class ReturnLineItem < ApplicationRecord
  belongs_to :return
  belongs_to :product
end
