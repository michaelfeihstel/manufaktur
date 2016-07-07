class Api::ContactInformationController < Api::ApplicationController
  respond_to :json
  before_action :current_user
  after_action :verify_authorized


  # GET /api/contact_information/
  def index
    @contact_information = ContactInformation.all
    authorize @contact_information
    render json: @contact_information
  end

  # GET /api/contact_information/1
  def show
    @contact_information = ContactInformation.find(params[:id])
    authorize @contact_information
    render json: @contact_information
  end

  # POST /api/contact_information/
  def create
    @contact_information = ContactInformation.new(contact_information_params)
    authorize @contact_information
    if @contact_information.save
      render json: @contact_information, status: :created
    else
      render json: @contact_information.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/contact_information/1
  def update
    @contact_information = ContactInformation.find(params[:id])
    authorize @contact_information
    if @contact_information.update(contact_information_params)
      render json: @contact_information
    else
      render json: @contact_information.errors, status: :unprocessable_entity
    end
  end


  private
  def contact_information_params
    params.require(:contact_information).permit(
      :id,
      :contact_id,
      :name,
      :value,
      :info_type,
      :default
    )
  end
end