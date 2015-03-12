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