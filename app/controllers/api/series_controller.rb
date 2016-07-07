module Api
  class SeriesController < ApplicationController
    respond_to :json
    before_action :current_user
    after_action :verify_authorized

    def index
      @series = Series.all
      authorize @series
      render json: @series
    end

    def show
      @series = Series.find(params[:id])
      authorize @series
      render json: @series
    end

    def create
      @series = Series.new(series_params)
      authorize @series
      if @series.save
        render json: @series, status: :created
      else
        render json: @series.errors, status: :unprocessable_entity
      end
    end

    def update
      @series = Series.find(params[:id])
      authorize @series
      if @series.update(series_params)
        render json: @series
      else
        render json: @series.errors, status: :unprocessable_entity
      end
    end



    private
    def series_params
      params.require(:series).permit(
        :id,
        :created_at,
        :name,
        :product_id,
        :finished_on,
        :comment,
        :g1,
        :g1h,
        :g2,
        :g2h,
        :g3,
        :g3h,
        :g4,
        :g4h,
        :g5,
        :g5h,
        :g6,
        :g6h,
        :g7,
        :g7h,
        :g8,
        :g8h,
        :g9,
        :g9h,
        :g10,
        :g10h,
        :g11,
        :g11h,
        :g12,
        :g12h,
        :g13,
        :g13h,
        :g14,
        :g14h,
        :g15,
        :g16
      )
    end

  end
end