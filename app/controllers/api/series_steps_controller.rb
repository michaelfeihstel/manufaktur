module Api
  class SeriesStepsController < ApplicationController
    respond_to :json
    after_action :verify_authorized

    def index
      @series_steps = SeriesStep.all
      authorize @series_steps
      render json: @series_steps
    end

    def show
      @series_step = SeriesStep.find(params[:id])
      authorize @series_step
      render json: @series_step
    end

    def create
      @series_step = SeriesStep.new(series_step_params)
      authorize @series_step
      if @series_step.save
        render json: @series_step, status: :created
      else
        render json: @series_step.errors, status: :unprocessable_entity
      end
    end

    def update
      @series_step = SeriesStep.find(params[:id])
      authorize @series_step
      if @series_step.update(series_step_params)
        render json: @series_step
      else
        render json: @series_step.errors, status: :unprocessable_entity
      end
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