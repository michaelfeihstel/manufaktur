class SizesController < ApplicationController
	after_action :verify_authorized

	def index
		@sizes = Size.all
		authorize @sizes

		respond_to do |format|
  		format.html # index.html.erb
  		format.json { render json: @sizes }
		end
	end

	def new
		@size = Size.new
		authorize @size
	end

	def create
		@size = Size.new(size_params)
		authorize @size

		if @size.save
			redirect_to sizes_path
		else
			render 'new'
		end
	end



	private
	def size_params
		params.require(:size).permit(
			:name,
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
		)
	end

end