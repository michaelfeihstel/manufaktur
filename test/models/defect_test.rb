# == Schema Information
#
# Table name: defects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class DefectTest < ActiveSupport::TestCase

  def defect
    @defect ||= Defect.new
  end

  def test_valid
    assert defect.valid?
  end

end
