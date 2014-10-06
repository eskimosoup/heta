class CreateTrainingLocations < ActiveRecord::Migration
  def change
    create_table :training_locations do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.text :directions
      t.text :booking_details

      t.timestamps
    end
  end
end
