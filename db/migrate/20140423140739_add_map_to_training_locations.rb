class AddMapToTrainingLocations < ActiveRecord::Migration
  def change
    add_column :training_locations, :latitude, :float
    add_column :training_locations, :longitude, :float
  end
end
