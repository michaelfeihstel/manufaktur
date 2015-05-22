module Api
  class CommentsController < ApplicationController
    respond_to :json
    before_action :current_user
    after_action :verify_authorized

    def index
      @comments = Comment.all.includes(:commentable)
      authorize @comments
      respond_with @comments
    end

    def show
      @comment = Comment.find(params[:id])
      authorize @comment
      respond_with @comment
    end

    def create
      @comment = Comment.new(comment_params)
      authorize @comment
      if @comment.save
        render nothing: true, status: :created
      end
    end

    def update
      @comment = Comment.find(params[:id])
      authorize @comment
      respond_with @comment.update(comment_params)
    end

    def destroy
      @comment = Comment.find(params[:id])
      authorize @comment
      respond_with @comment.destroy
    end




    private

    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

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
end