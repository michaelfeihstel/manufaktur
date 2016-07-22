class ContactFiltersController < ApplicationController
  def set_revenue_chart
    @contact = Contact.find(params[:id])
    @period = params[:period]
    render "contacts/ajax/set_revenue_chart"
  end
end