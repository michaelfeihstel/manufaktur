# == Schema Information
#
# Table name: contact_informations
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  name       :string(255)
#  value      :string(255)
#  info_type  :string(255)
#  default    :boolean          default("false")
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ContactInformation do
  pending "add some examples to (or delete) #{__FILE__}"
end
