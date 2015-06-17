class OrdersController < ApplicationController
  respond_to :html, :js, :json
  before_action :initialize_search
  before_action :authenticate_user!
  after_action :verify_authorized

  def dashboard
    @orders = Order.includes(:line_items, :products, :contact)
    @line_items = LineItem.includes(:product)
    authorize @orders
  end

  def index
    @orders = @search.result(distinct: true).includes(:line_items, :products, :contact).order(created_at: :desc).page(params[:page])
    authorize @orders
    @filter_selected = "all"
  end

  def search
    index
    render "index"
  end

  def quicksearch
    @orders = Order.where("billing_name LIKE ? OR billing_city LIKE ? OR id = ?", params[:quicksearch])
    render "index"
  end

  def index_created_at
    @date = "#{params[:year]}-#{params[:month]}-#{params[:day]}".to_date
    @orders = Order.where(created_at: @date).order(created_at: :desc)
    authorize @orders
    render "index"
  end

  def favorites
    @orders = Order.favorites.includes(:line_items, :products, :contact).order(created_at: :desc).page(params[:page]).per(100)
    authorize @orders
    @filter_selected = "favorites"
    render "index"
  end


  def show
    @order = Order.includes(:line_items, :contact, {:products => :size_set}).find(params[:id])
    authorize @order
    @order_presenter = OrdersPresenter.new(@order)
  end


  def new
    @search = Order.search(params[:q])
    @order = Order.new
    authorize @order
    @order.line_items.build
    @addresses = Address.all
    @products = Product.all.order(:name)
  end


  def create
    @order = Order.new(order_params)
    authorize @order

    if @order.save
      redirect_to @order
      flash[:success] = "Auftrag #{@order.id} wurde erstellt"
    else
      render "new"
    end
  end


  def edit
    @order = Order.includes([:contact, { line_items: :product }, { products: :size_set }]).find(params[:id])
    authorize @order
    @search = Order.includes(:customer, :line_items).order(created_at: :desc).page(params[:page]).per(50).search(params[:q])
    @orders = @search.result(distinct: true)
  end


  def update
    @order = Order.find(params[:id])
    authorize @order

    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html do
          redirect_to order_path
          flash[:success] = "Auftrag #{@order.id} wurde bearbeitet"
        end
        format.js
      else
        render 'edit'
      end

    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy

    redirect_to orders_path, :flash => { :success => "Auftrag #{@order.id} wurde gelöscht." }
  end

  def update_addresses
    @addresses = Address.where(addressable_id: params[:customer_id], addressable_type: params[:customer_type])

    respond_to do |format|
      format.js
    end
  end


  def complete
    @order = Order.find(params[:id])
    authorize @order
    @order.mark_as_completed

    redirect_to order_path
    if @order.completed_at.blank?
      flash[:success] = "Auftrag #{@order.id} als offen gekennzeichnet."
    else
      flash[:success] = "Auftrag #{@order.id} abgeschlossen."
    end
  end


  def mark
    @order = Order.find(params[:id])
    authorize @order
    
    @order.mark_as_marked

    redirect_to order_path
    if @order.marked == false
      flash[:success] = "Auftrag #{@order.id} aus Favoriten entfernt."
    else
      flash[:success] = "Auftrag #{@order.id} zu Favoriten hinzugefügt."
    end   
  end


  private
  def initialize_search
    @search = Order.search(params[:q])
  end

  def order_params
    params.require(:order).permit(
      :id,
      :billing_address_id,
      :cashback_percent,
      :cashback_until,
      :completed_at,
      :contact_id,
      :tax_id,
      :delivered_on,
      :delivery_address_id,
      :invoiced_at,
      :is_free,
      :is_scheduled_delivery,
      :is_vat_exempt,
      :marked,
      :paid_on,
      line_items_attributes: [
        :id,
        :order_id,
        :product_id,
        :price,
        :vat,
        :comment,
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
        :g16,
        :_destroy
      ]
    )
  end

end
