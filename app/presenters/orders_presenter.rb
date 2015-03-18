class OrdersPresenter
  def initialize(order)
    @order = order
  end

  def completed_status
    if @order.completed_at
      I18n::localize @order.completed_at, format: :date_only
    else
      "In Bearbeitung"
    end
  end





  private
  attr_reader :order
end