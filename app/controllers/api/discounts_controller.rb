class Api::DiscountsController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized

  def index
    @discounts = Discount.all
    authorize @discounts
    render json: @discounts
  end

  def show
    @discount = Discount.find(params[:id])
    authorize @discount
    render json: @discount
  end

  def create
    @discount = Discount.new(discount_params)
    authorize @discount
    if @discount.save
      render json: @discount, status: :created
    else
      render @discount.errors, status: :unprocessable_entity
    end
  end

  def update
    @discount = Discount.find(params[:id])
    authorize @discount
    if @discount.update(discount_params)
      render json: @discount
    else
      render json: @discount.errors, status: :unprocessable_entity
    end
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