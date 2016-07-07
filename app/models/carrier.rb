# == Schema Information
#
# Table name: carriers
#
#  id            :integer          not null, primary key
#  name          :string
#  tracking_link :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Carrier < ApplicationRecord
  has_many :shipments, dependent: :nullify
end
