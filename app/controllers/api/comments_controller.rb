class Api::CommentsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @comments = Comment.all
    authorize @comments
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    authorize @comment
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
  end




  private

  def comment_params
    params.require(:comment).permit(
      :id,
      :text,
      :commentable_id,
      :commentable_type,
      :created_at,
      :updated_at
    )
  end
end