class SizeSetsController < ApplicationController
  after_action :verify_authorized

  def index
    @size_sets = SizeSet.all
    authorize @size_sets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sizes }
    end
  end

  def show
    @size_set = SizeSet.find(params[:id])
    authorize @size_set
  end

  def new
    @size_set = SizeSet.new
    authorize @size_set
  end

  def edit
    @size_set = SizeSet.find(params[:id])
    authorize @size_set
  end

  def create
    @size_set = SizeSet.new(size_set_params)
    authorize @size_set

    if @size_set.save
      redirect_to @size_set
    else
      render 'new'
    end
  end

  def update
    @size_set = SizeSet.find(params[:id])
    authorize @size_set

    if @size_set.update_attributes(size_set_params)
      redirect_to @size_set
    else
      redner "edit"
    end
  end



  private
  def size_set_params
    params.require(:size_set).permit(
      :name,
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