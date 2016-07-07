class Api::ContactsController < Api::ApplicationController
  respond_to :json
  after_action :verify_authorized
  protect_from_forgery except: [:create, :update]

  # GET /api/contacts/
  def index
    @contacts = Contact.all
    authorize @contacts
    render json: @contacts
  end

  # GET /api/contacts/1/
  def show
    @contact = Contact.find(params[:id])
    authorize @contact
    render json: @contact
  end

  # POST /api/contacts/
  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/contacts/1
  def update
    @contact = Contact.find(params[:id])
    authorize @contact
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end


  private

  def contact_params
    params.require(:contact).permit(
      :id,
      :contact_role_id,
      :contact_role_type,
      :created_at,
      :updated_at,
      :name,
      addresses_attributes: [
        :id,
        :description,
        :contact_id,
        :name,
        :street,
        :house_number,
        :zip,
        :city,
        :country,
        :latitude,
        :longitude,
        :_destroy
      ],
      employee_attributes: [
        :id,
        :active
      ]
    )
  end
end