class RetailersController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @retailers = @search.result(distinct: true).includes(:addresses).order(:name)
    authorize @retailers
  end

  def search
    index
    render "index"
  end

  def show
    @retailer = Retailer.includes(:addresses, :contact_information).find(params[:id])
    authorize @retailer
  end

  def new
    @retailer = Retailer.new
    authorize @retailer
    @retailer.addresses.build
    @retailer.emails.build
  end


  def create
    @retailer = Retailer.new(retailer_params)
    authorize @retailer

    if @retailer.save
      redirect_to @retailer
    else
      render 'new'
    end
  end


  def edit
    @retailer = Retailer.find(params[:id])
    authorize @retailer
  end


  def update
    @retailer = Retailer.find(params[:id])
    authorize @retailer
    if @retailer.update_attributes(retailer_params)
      redirect_to retailer_path(@retailer), notice: "Kontakt aktualisiert."
    else
      render 'edit'
    end
  end

  def destroy
    @retailer = Retailer.find(params[:id])
    authorize @retailer
    @retailer.destroy

    redirect_to retailers_path, :flash => { :success => "Contact deleted!" }
  end


  private
  def retailer_params
    params.require(:retailer).permit(
      :name,
      addresses_attributes: [
        :id,
        :retailer_id,
        :description,
        :name,
        :street,
        :house_number,
        :zip,
        :city,
        :country,
        :_destroy 
      ],
      emails_attributes: [
        :id,
        :contact_id,
        :name,
        :value,
        :_destroy
      ],
      phones_attributes: [
        :id,
        :contact_id,
        :name,
        :value,
        :_destroy
      ]
    )
  end

  def initialize_search
    @search = Retailer.search(params[:q])
  end
end