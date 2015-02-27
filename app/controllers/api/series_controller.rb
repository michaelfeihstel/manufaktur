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
        :us1,
        :us1h,
        :us2,
        :us2h,
        :us3,
        :us3h,
        :us4,
        :us4h,
        :us5,
        :us5h,
        :us6,
        :us6h,
        :us7,
        :us7h,
        :us8,
        :us8h,
        :us9,
        :us9h,
        :us10,
        :us10h,
        :us11,
        :us11h,
        :us12,
        :us12h,
        :us13,
        :us13h,
        :us14,
        :us14h,
        :us15,
        :us16
      )
    end

  end
end