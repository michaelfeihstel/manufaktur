class VariationSetsController < ApplicationController

	def index
		@variation_sets = VariationSet.all

		respond_to do |format|
  		format.html # index.html.erb
  		format.json { render json: @variation_sets }
		end
	end




	def show
		@variation_set = VariationSet.find(params[:id])
	end





	def new
		@variation_set = VariationSet.new
		@variation_set.variations.build
	end





	def create
		@variation_set = VariationSet.new(variation_set_params)

		if @variation_set.save
			redirect_to variation_sets_path
		else
			render 'new'
		end
	end




	def destroy
		@variation_set = VariationSet.find(params[:id])
		@variation_set.destroy

		redirect_to variation_sets_path, :flash => { :success => "Variation set deleted!" }
	end


	private
	def variation_set_params
		params.require(:variation_set).permit(
			:name,
			:type,
			variations_attributes: [:id, :name, :_destroy]
		)
	end

end