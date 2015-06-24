# == Schema Information
#
# Table name: discounts
#
#  id           :integer          not null, primary key
#  line_item_id :integer
#  name         :string
#  discount     :decimal(, )
#  enabled      :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_discounts_on_enabled       (enabled)
#  index_discounts_on_line_item_id  (line_item_id)
#

class Discount < ActiveRecord::Base
  # Associations
  belongs_to :line_item

  # Scopes
  scope :enabled, -> { where(enabled: true) }
  scope :disabled, -> { where(enabled: false) }

  # Methods
  def humanized_discount
    ( discount || 0 ) * 100
  end

end
