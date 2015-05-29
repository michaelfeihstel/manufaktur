module Api
  class SeriesController < ApplicationController
    respond_to :json

    def index
      @series = respond_with Series.all, include: :product
    end

    def show
      @series = respond_with Series.find(params[:id]), include: :product
    end

    def create
      @series = respond_with Series.create(series_params), include: :product
    end

    def update
      @series = respond_with Series.find(params[:id]).update_attributes(series_params), include: :product
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