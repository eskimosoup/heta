class AddLocationToAvailableApprentices < ActiveRecord::Migration
  def change
    add_column :available_apprentices, :training_location_id, :integer
  end
end
