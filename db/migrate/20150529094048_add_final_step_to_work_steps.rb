class AddFinalStepToWorkSteps < ActiveRecord::Migration
  def change
    add_column :work_steps, :final_step, :boolean, default: false
  end
end
