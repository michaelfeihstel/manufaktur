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

require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:default)
    @user = users(:default_user)

    sign_in @user
  end
end
