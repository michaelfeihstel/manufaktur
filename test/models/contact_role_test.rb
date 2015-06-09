# == Schema Information
#
# Table name: contact_roles
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  human_readable_name :string
#

require "test_helper"

class ContactRoleTest < ActiveSupport::TestCase

  def contact_role
    @contact_role ||= ContactRole.new
  end

  def test_valid
    assert contact_role.valid?
  end

end
