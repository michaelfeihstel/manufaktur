class Api::DiscountsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @discounts = Discount.all
    authorize @discounts
    respond_with @discounts
  end

  def show
    @discount = Discount.find(params[:id])
    authorize @discount
    respond_with @discount
  end

  def create
    @discount = Discount.new(discount_params)
    authorize @discount
    if @discount.save
      render nothing: true, status: :created
    end
  end

  def update
    @discount = Discount.find(params[:id])
    authorize @discount
    respond_with @discount.update(discount_params)
  end





  private

  def discount_params
    params.require(:discount).permit(
      :id,
      :created_at,
      :line_item_id,
      :name,
      :discount,
      :enabled
    )
  end
end