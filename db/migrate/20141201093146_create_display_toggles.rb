class CreateDisplayToggles < ActiveRecord::Migration
  def change
    create_table :display_toggles do |t|
      t.string :name
      t.boolean :display

      t.timestamps
    end
  end
end
