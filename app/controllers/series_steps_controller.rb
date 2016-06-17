# == Schema Information
#
# Table name: series_steps
#
#  id           :integer          not null, primary key
#  series_id    :integer
#  work_step_id :integer
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SeriesStepsController < ApplicationController
  after_action :verify_authorized

  def index
  end

  def show
    @series_step = SeriesStep.includes({entries: [:contact]}, :series, :work_step).find(params[:id])
    authorize @series_step
  end
end
