class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image
      t.string :image_alt
      t.string :caption
      t.boolean :display, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
