# == Schema Information
#
# Table name: size_sets
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  g1         :string
#  g1h        :string
#  g2         :string
#  g2h        :string
#  g3         :string
#  g3h        :string
#  g4         :string
#  g4h        :string
#  g5         :string
#  g5h        :string
#  g6         :string
#  g6h        :string
#  g7         :string
#  g7h        :string
#  g8         :string
#  g8h        :string
#  g9         :string
#  g9h        :string
#  g10        :string
#  g10h       :string
#  g11        :string
#  g11h       :string
#  g12        :string
#  g12h       :string
#  g13        :string
#  g13h       :string
#  g14        :string
#  g14h       :string
#  g15        :string
#  g16        :string
#

require "test_helper"

class SizeSetTest < ActiveSupport::TestCase

  def size_set
    @size_set ||= SizeSet.new
  end

  def test_valid
    assert size_set.valid?
  end

end
