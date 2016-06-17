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

class CommentsController < ApplicationController

  def new
    @commentable = find_parent
    @comment = @commentable.comments.new
  end

  def cancel
    @commentable = find_parent
    render
  end

  def create
    @commentable = find_parent
    @comment = @commentable.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      render
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
  end





  private
  def comment_params
    params.require(:comment).permit(
      :user_id,
      :text,
      :important
    )
  end

  def find_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
