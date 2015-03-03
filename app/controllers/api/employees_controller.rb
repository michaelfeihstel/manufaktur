module Api
  class EmployeesController < ApplicationController
    respond_to :json





    def index
      @employees = Employee.all
      respond_with @employees
    end

    def show
      @employee = Employee.find(params[:id])
      respond_with @employee
    end

    def update
      @employee = Employee.find(params[:id])
      respond_with @employee.update_attributes(employee_params)
    end

    def create
      @employee = Employee.create(employee_params)
      respond_with :api, @employee
    end





    private
    def employee_params
      params.require(:employee).permit(
        :id,
        :name,
        :active
      )
    end

  end
end