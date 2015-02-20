class SeriesController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @series = @search.result(distinct: true).includes(:product).order(:id)
    authorize @series
  end

  def new
    @series = Series.new
    authorize @series
  end

  def create
    @series = Series.create(series_params)
    authorize @series

    if @series.save
      redirect_to series_path(@series)
    else
      render "new"
    end
  end

  def edit
    @series = Series.find(params[:id])
    authorize @series
  end

  def update
    @series = Series.find(params[:id])
    authorize @series

    if @series.update_attributes(series_params)
      redirect_to @series
    else
      render "edit"
    end
  end

  def destroy
    @series = Series.find(params[:id])
    authorize @series

    @series.destroy

    redirect_to series_index_path, flash: { success: "Serie  #{@series.id} wurde gelöscht." }
  end




  private
  def series_params
    params.require(:series).permit(
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

  def initialize_search
    @search = Series.search(params[:q])
  end
end