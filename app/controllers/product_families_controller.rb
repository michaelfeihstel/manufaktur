class ProductFamiliesController < ApplicationController
  def create
    @product_family = ProductFamily.new(product_family_params)
    if @product_family.save
      redirect_to settings_path
    end
  end





  private
  def product_family_params
    params.require(:product_family).permit(:name)
  end
end