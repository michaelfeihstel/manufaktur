class AddContactToSeriesStepEntries < ActiveRecord::Migration
  def change
    add_reference :series_step_entries, :contact, index: true
    add_foreign_key :series_step_entries, :contacts
  end
end
