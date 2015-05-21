require "test_helper"

class ContactRoleTest < ActiveSupport::TestCase

  def contact_role
    @contact_role ||= ContactRole.new
  end

  def test_valid
    assert contact_role.valid?
  end

end
