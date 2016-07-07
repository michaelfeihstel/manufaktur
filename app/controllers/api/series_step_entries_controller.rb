class Api::SeriesStepEntriesController < Api::ApplicationController
  respond_to :json
  after_action :verify_authorized

  def index
    @series_step_entries = SeriesStepEntry.all
    authorize @series_step_entries
    render json: @series_step_entries
  end

  def show
    @series_step_entry = SeriesStepEntry.find(params[:id])
    authorize @series_step_entry
    render json: @series_step_entry
  end

  def create
    @series_step_entry = SeriesStepEntry.new(series_step_entry_params)
    authorize @series_step_entry
    if @series_step_entry.save
      render json: @series_step_entry, status: :created
    else
      render json: @series_step_entry.errors, status: :unprocessable_entity
    end
  end

  def update
    @series_step_entry = SeriesStepEntry.find(params[:id])
    authorize @series_step_entry
    if @series_step_entry.update(series_step_entry_params)
      render json: @series_step_entry
    else
      render json: @series_step_entry.errors, status: :unprocessable_entity
    end
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