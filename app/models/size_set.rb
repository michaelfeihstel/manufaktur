# == Schema Information
#
# Table name: size_sets
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  g1         :integer
#  g1h        :integer
#  g2         :integer
#  g2h        :integer
#  g3         :integer
#  g3h        :integer
#  g4         :integer
#  g4h        :integer
#  g5         :integer
#  g5h        :integer
#  g6         :integer
#  g6h        :integer
#  g7         :integer
#  g7h        :integer
#  g8         :integer
#  g8h        :integer
#  g9         :integer
#  g9h        :integer
#  g10        :integer
#  g10h       :integer
#  g11        :integer
#  g11h       :integer
#  g12        :integer
#  g12h       :integer
#  g13        :integer
#  g13h       :integer
#  g14        :integer
#  g14h       :integer
#  g15        :integer
#  g16        :integer
#

class SizeSet < ActiveRecord::Base
  has_many :products

  def sizes_as_array
    [g1,g1h,g2,g2h,g3,g3h,g4,g4h,g5,g5h,g6,g6h,g7,g7h,g8,g8h,g9,g9h,g10,g10h,g11,g11h,g12,g12h,g13,g13h,g14,g14h,g15,g16]
  end

  def sizes_as_hash
    {
      g1: g1,
      g1h: g1h,
      g2: g2,
      g2h: g2h,
      g3: g3,
      g3h: g3h,
      g4: g4,
      g4h: g4h,
      g5: g5,
      g5h: g5h,
      g6: g6,
      g6h: g6h,
      g7: g7,
      g7h: g7h,
      g8: g8,
      g8h: g8h,
      g9: g9,
      g9h: g9h,
      g10: g10,
      g10h: g10h,
      g11: g11,
      g11h: g11h,
      g12: g12,
      g12h: g12h,
      g13: g13,
      g13h: g13h,
      g14: g14,
      g14h: g14h,
      g15: g15,
      g16: g16
    }
  end
end
