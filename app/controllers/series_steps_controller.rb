class SeriesStepsController < ApplicationController
  after_action :verify_authorized

  def index
  end

  def show
    @series_step = SeriesStep.includes(:series_step_entries, :series, :work_step).find(params[:id])
    authorize @series_step
  end
end