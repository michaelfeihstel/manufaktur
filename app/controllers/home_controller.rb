class HomeController < ApplicationController
  def dashboard
    @orders = Order.includes(:line_items, :products, :contact)
    @line_items = LineItem.includes(:product)
    authorize @orders
  end
end
