module Api
  class SeriesStepEntriesController < ApplicationController
    respond_to :json

    def index
      @series_step_entries = SeriesStepEntry.all
      respond_with @series_step_entries
    end

    def show
      @series_step_entry = SeriesStepEntry.find(params[:id])
      respond_with @series_step_entry
    end

    def update
      @series_step_entry = SeriesStepEntry.find(params[:id])
      respond_with @series_step_entry.update_attributes(series_step_entry_params)
    end

    def create
      @series_step_entry = SeriesStepEntry.create(series_step_entry_params)
      respond_with :api, @series_step_entry
    end





    private
    def series_step_entry_params
      params.require(:series_step_entry).permit(
        :id,
        :series_step_id,
        :contact_id,
        :date,
        :b_stock,
        :final_step,
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