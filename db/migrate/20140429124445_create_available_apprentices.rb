class CreateAvailableApprentices < ActiveRecord::Migration
  def change
    create_table :available_apprentices do |t|
      t.string :name
      t.string :trade
      t.date :date_available_from
      t.string :image
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
