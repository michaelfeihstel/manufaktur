class SettingsController < ApplicationController
  def settings
    @product_families = ProductFamily.all
    @product_family = ProductFamily.new
    render "pages/settings"
  end
end