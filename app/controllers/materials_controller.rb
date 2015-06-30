class MaterialsController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]
  after_action :verify_authorized




  def index
    @materials = Material.includes(:material_properties).order(:name).page(params[:page])
    authorize @materials
  end

  def search
    @materials = @search.result(distinct: true).includes(:material_properties).order(:name).page(params[:page])
    authorize @materials
    render "index"
  end

  def show
    @material = Material.includes(material_consumptions: [:product]).find(params[:id])
    authorize @material
  end

  def new
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.create(material_params)
    authorize @material

    if @material.save
      redirect_to @material
    else
      render "new"
    end
  end

  def edit
    @material = Material.find(params[:id])
    authorize @material
  end

  def update
    @material = Material.find(params[:id])
    authorize @material

    if @material.update_attributes(material_params)
      redirect_to @material
    else
      render "edit"
    end
  end

  def destroy
    @material = Material.find(params[:id])
    authorize @material

    @material.destroy

    redirect_to materials_path, flash: { success: "#{@material.name} wurde gelöscht" }
  end





  private

  def initialize_search
    @search = Material.search(params[:q])
  end

  def material_params
    params.require(:material).permit(
      :contact_id,
      :name,
      :supplier_sku,
      :unit,
      :price,
      :comment,
      material_properties_attributes: [
        :id,
        :material_id,
        :name,
        :value,
        :use_in_name,
        :_destroy
      ]
    )
  end
end