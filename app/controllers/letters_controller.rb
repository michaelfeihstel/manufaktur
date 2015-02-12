class LettersController < ApplicationController
  before_action :initialize_search

  def index
    @letters = @search.result(distinct: true).order_by_date_desc.page(params[:page]).per(50)
  end

  def search
    index
    render "index"
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.create(letter_params)
    if @letter.save
      redirect_to letter_path(@letter)
    else
      render "new"
    end
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])
    if @letter.update_attributes(letter_params)
      redirect_to letter_path(@letter), notice: "Brief aktualisiert"
    else
      render "edit"
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to letters_path
  end



  private
  def initialize_search
    @search = Letter.search(params[:q])
  end

  def letter_params
    params.require(:letter).permit(
      :receiver_id,
      :receiver_type,
      :address_id,
      :created_at,
      :name,
      :street,
      :house_number,
      :zip,
      :city,
      :country,
      :subject,
      :body
    )
  end

end