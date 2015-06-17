require "test_helper"

class TaxTest < ActiveSupport::TestCase

  def tax
    @tax ||= Tax.new
  end

  def test_valid
    assert tax.valid?
  end

end
