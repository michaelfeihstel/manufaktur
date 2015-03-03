# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class EmployeeTest < ActiveSupport::TestCase

  def employee
    @employee ||= Employee.new
  end

  def test_valid
    assert employee.valid?
  end

end
