class OrdersController < ApplicationController
	respond_to :html, :js, :json
	
	def index
		@search = Order.includes(:line_items, :products, :contact).order(created_at: :desc).limit(100).search(params[:q])
		@orders = @search.result(distinct: true)
		@filter_selected = "all"

		respond_to do |format|
			format.html # index.html.erb
  		format.json { render json: @orders }
		end
	end

	def index_created_at
		@search = Order.search(params[:q])
		@date = "#{params[:year]}-#{params[:month]}-#{params[:day]}".to_date
		@orders = Order.where(created_at: @date).order(created_at: :desc)
		render "index"
	end

	def get_marked_orders
		@search = Order.marked_as_favorite.search(params[:q])
		@orders = @search.result(distinct: true)
		@filter_selected = "favorites"
		render "index"
	end


	def show
		@search = Order.search(params[:q])
		@orders = @search.result(distinct: true).includes(:contact).page(params[:page]).per(20)
		@order = Order.includes(:line_items, :contact).find(params[:id])
	end


	def new
		@order = Order.new
		@order.line_items.build
		@addresses = Address.all
	end


	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to @order
			flash[:success] = "Auftrag #{@order.id} wurde erstellt"
		else
			render "new"
		end
	end


	def edit
		@order = Order.find(params[:id])

		@search = Order.includes(:line_items, :products, :contact).order(created_at: :desc).limit(100).search(params[:q])
		@orders = @search.result(distinct: true)
	end


	def update
		@order = Order.find(params[:id])

		respond_to do |format|

			if @order.update_attributes(order_params)
				format.html do
					redirect_to edit_order_path
					flash[:success] = "Auftrag #{@order.id} wurde bearbeitet"
				end

				format.json { render json: @order }
				format.js
			else
				render 'edit'
			end

		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy

		redirect_to orders_path, :flash => { :success => "Auftrag #{@order.id} wurde gelöscht." }
	end

	def update_addresses
		@addresses = Address.where(contact_id: params[:contact_id])

		respond_to do |format|
			format.js
		end
	end


	def completed
		@order = Order.find(params[:id])

		@order.mark_as_completed

		redirect_to order_path
		if @order.completed_at.blank?
			flash[:success] = "Auftrag #{@order.id} als offen gekennzeichnet."
		else
			flash[:success] = "Auftrag #{@order.id} abgeschlossen."
		end
	end


	def marked
		@order = Order.find(params[:id])

		@order.mark_as_marked

		redirect_to order_path

		if @order.marked == false
			flash[:success] = "Auftrag #{@order.id} aus Favoriten entfernt."
		else
			flash[:success] = "Auftrag #{@order.id} zu Favoriten hinzugefügt."
		end		
	end


	private
	def order_params
		params.require(:order).permit(
			:id,
			:delivered_on,
			:invoiced_at,
			:completed_at,
			:is_scheduled_delivery,
			:is_free,
			:is_vat_exempt,
			:cashback_percent,
			:cashback_until,
			:contact_id,
			:billing_address_id,
			:delivery_address_id,
			:marked,
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
