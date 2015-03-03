class MaterialsController < ApplicationController
  after_action :verify_authorized




  def index
    @materials = Material.includes(:material_properties).all
    authorize @materials
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
  def material_params
    params.require(:material).permit(
      :name,
      :supplier_sku,
      :unit,
      :price,
      :comment,
      material_property_attributes: [
        :material_id,
        :name,
        :value,
        :use_in_name,
        :_destroy
      ]
    )
  end
end