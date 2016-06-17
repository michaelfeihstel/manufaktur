# == Schema Information
#
# Table name: letters
#
#  id           :integer          not null, primary key
#  address_id   :integer
#  name         :string(255)
#  street       :string(255)
#  house_number :string(255)
#  zip          :string(255)
#  city         :string(255)
#  country      :string(255)
#  subject      :string(255)
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#

class LettersController < ApplicationController
  before_action :initialize_search
  after_action :verify_authorized

  def index
    @letters = Letter.order_by_date_desc.page(params[:page]).per(50)
    authorize @letters
  end

  def search
    @letters = @search.result(distinct: true).order_by_date_desc.page(params[:page]).per(50)
    authorize @letters

    render "index"
  end

  def show
    @letter = Letter.find(params[:id])
    authorize @letter
  end

  def new
    @letter = Letter.new
    authorize @letter
  end

  def create
    @letter = Letter.create(letter_params)
    authorize @letter

    if @letter.save
      redirect_to @letter
    else
      render "new"
    end
  end

  def edit
    @letter = Letter.find(params[:id])
    authorize @letter
  end

  def update
    @letter = Letter.find(params[:id])
    authorize @letter

    if @letter.update_attributes(letter_params)
      redirect_to @letter, notice: "Brief aktualisiert"
    else
      render "edit"
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    authorize @letter
    
    @letter.destroy
    redirect_to letters_path
  end



  private
  def initialize_search
    @search = Letter.search(params[:q])
  end

  def letter_params
    params.require(:letter).permit(
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
