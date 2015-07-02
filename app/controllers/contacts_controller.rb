class ContactsController < ApplicationController
  before_action :initialize_search, except: [:create, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @contacts = Contact.includes(:addresses, :contact_role).order(:name).page(params[:page]).per(50)
    authorize @contacts
  end

  def retailers
    @contacts = Contact.includes(:addresses, :contact_role).where(contact_roles: { name: "retailer" }).order(:name).page(params[:page]).per(50)
    authorize @contacts

    @filter = action_name

    render "index"
  end

  def employees
    @contacts = Contact.includes(:addresses, :contact_role).where(contact_roles: { name: "employee" }).order(:name).page(params[:page]).per(50)
    authorize @contacts

    @filter = action_name

    render "index"
  end

  def suppliers
    @contacts = Contact.includes(:addresses, :contact_role).where(contact_roles: { name: "supplier" }).order(:name).page(params[:page]).per(50)
    authorize @contacts

    @filter = action_name

    render "index"
  end

  def customers
    @contacts = Contact.includes(:addresses, :contact_role).where(contact_roles: { name: "customers" }).order(:name).page(params[:page]).per(50)
    authorize @contacts

    @filter = action_name

    render "index"
  end

  def filter
    @filter = params[:filter]
    @contacts = Contact.filter(@filter).includes(:addresses, :contact_role).order(:name).page(params[:page]).per(50)
    authorize @contacts
    render "index"
  end

  def search
    @contacts = @search.result(distinct: true).includes(:addresses, :contact_role).order(:name).page(params[:page])
    authorize @contacts
    render "index"
  end

  def show
    @contact = Contact.includes(:addresses, :contact_information, :line_items, :letters).find(params[:id])
    @orders = @contact.orders.includes(:line_items, :products).page(params[:page]).per(25)
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
      :contact_role_id,
      :test,
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
    )
  end

  def initialize_search
    @search = Contact.search(params[:q])
  end
end