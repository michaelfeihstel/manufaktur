module Api
  class LettersController < ApplicationController
    respond_to :json
    before_action :current_user
    after_action :verify_authorized
    protect_from_forgery except: [:create, :update]

    # GET /api/letters/
    def index
      @letters = Letter.all
      authorize @letters
      render json: @letters
    end

    # GET /api/letters/1
    def show
      @letter = Letter.find(params[:id])
      authorize @letter
      render json: @letter
    end

    # POST /api/letters
    def create
      @letter = Letter.new(letter_params)
      authorize @letter
      if @letter.save
        render json: @letter, status: :created
      else
        render json: @letter.errors, status: :unprocessable_entity
      end
    end

    # PUT /api/letters/1
    def update
      @letter = Letter.find(params[:id])
      authorize @letter
      if @letter.update(letter_params)
        render json: @letter
      else
        render json: @letter.errors, status: :unprocessable_entity
      end
    end



    private
    
    def letter_params
      params.require(:letter).permit(
        :id,
        :created_at,
        :contact_id,
        :address_id,
        :name,
        :street,
        :house_number,
        :zip,
        :city,
        :country,
        :subject,
        :body,
        :_destroy
      )
    end

  end
end