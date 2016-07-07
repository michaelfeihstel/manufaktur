# == Schema Information
#
# Table name: materials
#
#  id           :integer          not null, primary key
#  name         :string
#  supplier_sku :string
#  unit         :string
#  price        :decimal(8, 2)
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :integer
#

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
    @filter = { from: 12.months.ago.to_date, to: Date.today }
    @material = Material.includes(:series_step_entries, material_consumptions: [:product]).find(params[:id])
    authorize @material
  end

  def set_period
    @filter = { from: params[:from], to: params[:to] }
    @material = Material.includes(:series_step_entries, material_consumptions: [:product]).find(params[:id])
    authorize @material
  end

  def new
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.new(material_params)
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
