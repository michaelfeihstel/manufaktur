# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  finished_on :date
#  comment     :text
#  g1          :integer
#  g1h         :integer
#  g2          :integer
#  g2h         :integer
#  g3          :integer
#  g3h         :integer
#  g4          :integer
#  g4h         :integer
#  g5          :integer
#  g5h         :integer
#  g6          :integer
#  g6h         :integer
#  g7          :integer
#  g7h         :integer
#  g8          :integer
#  g8h         :integer
#  g9          :integer
#  g9h         :integer
#  g10         :integer
#  g10h        :integer
#  g11         :integer
#  g11h        :integer
#  g12         :integer
#  g12h        :integer
#  g13         :integer
#  g13h        :integer
#  g14         :integer
#  g14h        :integer
#  g15         :integer
#  g16         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :integer
#

class SeriesController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @series = Series.includes(:product).newest.page(params[:page])
    authorize @series
  end

  def search
    @series = @search.result(distinct: true).includes(:product).newest.page(params[:page])
    authorize @series
    render "index"
  end

  def dashboard
    @series = Series.includes(:product).newest
    @completed = SeriesStepEntry.completed_since(11.months.ago.beginning_of_month).group_by_month(:date, range: 11.months.ago.beginning_of_month..Date.today).sum("(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0))")
    @scheduled = Series.scheduled_since(11.months.ago.beginning_of_month).group_by_month(:finished_on, range: 11.months.ago.beginning_of_month..Date.today).sum("(COALESCE(g1, 0)+COALESCE(g1h, 0)+COALESCE(g2, 0)+COALESCE(g2h, 0)+COALESCE(g3, 0)+COALESCE(g3h, 0)+COALESCE(g4, 0)+COALESCE(g4h, 0)+COALESCE(g5, 0)+COALESCE(g5h, 0)+COALESCE(g6, 0)+COALESCE(g6h, 0)+COALESCE(g7, 0)+COALESCE(g7h, 0)+COALESCE(g8, 0)+COALESCE(g8h, 0)+COALESCE(g9, 0)+COALESCE(g9h, 0)+COALESCE(g10, 0)+COALESCE(g10h, 0)+COALESCE(g11, 0)+COALESCE(g11h, 0)+COALESCE(g12, 0)+COALESCE(g12h, 0)+COALESCE(g13, 0)+COALESCE(g13h, 0)+COALESCE(g14, 0)+COALESCE(g14h, 0)+COALESCE(g15, 0)+COALESCE(g16, 0))")
    authorize @series
  end

  def show
    @series = Series.includes(series_steps: [:work_step]).find(params[:id])
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
