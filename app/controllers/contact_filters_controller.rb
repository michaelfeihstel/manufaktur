class ContactFiltersController < ApplicationController
  respond_to :js

  def set_revenue_chart
    @contact = Contact.find(params[:id])
    @group_by = params[:group_by]
    render "contacts/ajax/set_revenue_chart"
  end
end