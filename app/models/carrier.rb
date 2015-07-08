# == Schema Information
#
# Table name: carriers
#
#  id                   :integer          not null, primary key
#  name                 :string
#  tracking_link_prefix :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Carrier < ActiveRecord::Base
  has_many :shipments, dependent: :nullify
end
