# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiKey < ActiveRecord::Base
  # associations
  belongs_to :user

  # callbacks
  before_create :generate_key





  private

  def generate_key
    begin
      self.key = SecureRandom.hex
    end while self.class.exists?(key: key)
  end
end
