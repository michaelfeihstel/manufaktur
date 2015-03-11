class ContactsController < ApplicationController
  before_action :initialize_search, only: [:index, :search, :show, :edit, :new]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @contacts = @search.result(distinct: true).includes(:addresses).order(:name)
    authorize @contacts
  end

  def search
    index
    render "index"
  end

  def show
    @contact = Contact.includes(:addresses, :contact_information, orders: [:line_items]).find(params[:id])
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
    @contact.addresses.build
    @contact.emails.build
  end


  def create
    @contact = Contact.new(contact_params)
    authorize @contact

    if @contact.save
      redirect_to @contact
    else
      render 'new'
    end
  end


  def edit
    @contact = Contact.find(params[:id])
    authorize @contact
  end


  def update
    @contact = Contact.find(params[:id])
    authorize @contact
    if @contact.update_attributes(contact_params)
      redirect_to contact_path(@contact), notice: "Kontakt aktualisiert."
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    authorize @contact
    @contact.destroy

    redirect_to contacts_path, :flash => { :success => "Contact deleted!" }
  end


  private
  def contact_params
    params.require(:contact).permit(
      :name,
      :contactable_type,
      addresses_attributes: [
        :id,
        :contact_id,
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
      ],
      employee_attributes: [
        :contact_id,
        :active
      ]
    )
  end

  def initialize_search
    @search = Contact.search(params[:q])
  end
end