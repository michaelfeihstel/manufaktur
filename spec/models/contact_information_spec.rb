# == Schema Information
#
# Table name: contact_informations
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  name       :string(255)
#  value      :string(255)
#  info_type  :string(255)
#  default    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_contact_informations_on_contact_id  (contact_id)
#  index_contact_informations_on_info_type   (info_type)
#  index_contact_informations_on_value       (value)
#

require 'spec_helper'

describe ContactInformation do
  pending "add some examples to (or delete) #{__FILE__}"
end
