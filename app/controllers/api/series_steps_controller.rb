module Api
  class SeriesStepsController < ApplicationController
    respond_to :json

    def index
      @series_steps = SeriesStep.all
      respond_with @series_steps
    end

    def show
      @series_step = SeriesStep.find(params[:id])
      respond_with @series_step
    end

    def create
      @series_step = SeriesStep.create(series_step_params)
      respond_with :api, @series_step
    end

    def update
      @series_step = SeriesStep.find(params[:id])
      respond_with @series_step.update_attributes(series_step_params)
    end





    private
    def series_step_params
      params.require(:series_step).permit(
        :id,
        :series_id,
        :work_step_id,
        :comment
      )
    end

  end
end