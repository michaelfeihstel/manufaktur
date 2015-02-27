class WorkStepsController < ApplicationController
  after_action :verify_authorized

  def index
    @work_steps = WorkStep.all
    authorize @work_steps
  end

  def show
    @work_step = WorkStep.find(params[:id])
    authorize @work_step
  end

  def new
    @work_step = WorkStep.new
    authorize @work_step
  end

  def create
    @work_step = WorkStep.create(work_step_params)
    authorize @work_step

    if @work_step.save
      redirect_to work_step_path(@work_step)
    else
      render "new"
    end
  end

  def edit
    @work_step = WorkStep.find(params[:id])
    authorize @work_step
  end

  def update
    @work_step = WorkStep.find(params[:id])
    authorize @work_step

    if @work_step.update_attributes(work_step_params)
      redirect_to @work_step
    else
      render "edit"
    end
  end





  private
  def work_step_params
    params.require(:work_step).permit(
      :name,
      :active
    )
  end

end