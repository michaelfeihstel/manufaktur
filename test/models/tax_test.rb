# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  name       :string
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class TaxTest < ActiveSupport::TestCase

  def tax
    @tax ||= Tax.new
  end

  def test_valid
    assert tax.valid?
  end

end
