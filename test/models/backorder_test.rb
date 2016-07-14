# == Schema Information
#
# Table name: backorders
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  g1         :integer          default(0)
#  g1h        :integer          default(0)
#  g2         :integer          default(0)
#  g2h        :integer          default(0)
#  g3         :integer          default(0)
#  g3h        :integer          default(0)
#  g4         :integer          default(0)
#  g4h        :integer          default(0)
#  g5         :integer          default(0)
#  g5h        :integer          default(0)
#  g6         :integer          default(0)
#  g6h        :integer          default(0)
#  g7         :integer          default(0)
#  g7h        :integer          default(0)
#  g8         :integer          default(0)
#  g8h        :integer          default(0)
#  g9         :integer          default(0)
#  g9h        :integer          default(0)
#  g10        :integer          default(0)
#  g10h       :integer          default(0)
#  g11        :integer          default(0)
#  g11h       :integer          default(0)
#  g12        :integer          default(0)
#  g12h       :integer          default(0)
#  g13        :integer          default(0)
#  g13h       :integer          default(0)
#  g14        :integer          default(0)
#  g14h       :integer          default(0)
#  g15        :integer          default(0)
#  g16        :integer          default(0)
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_backorders_on_order_id    (order_id)
#  index_backorders_on_product_id  (product_id)
#

require 'test_helper'

class BackorderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
