# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  text             :text
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  important        :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  # associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
