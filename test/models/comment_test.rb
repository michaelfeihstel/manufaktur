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
# Indexes
#
#  index_comments_on_commentable_id  (commentable_id)
#  index_comments_on_user_id         (user_id)
#

require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def comment
    @comment ||= Comment.new
  end

  def test_valid
    assert comment.valid?
  end

end
