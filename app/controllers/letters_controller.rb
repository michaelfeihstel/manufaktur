class LettersController < ApplicationController
	before_action :initialize_search

	def index
		@letters = @search.result(distinct: true).order_by_date_desc.page(params[:page]).per(50)
	end

	def show
		@letter = Letter.find(params[:id])
	end

	def new
		@letter = Letter.new
	end

	def create

	end

	def edit
		@letter = Letter.find(params[:id])
	end



	private
	def initialize_search
		@search = Letter.search(params[:q])
	end

end