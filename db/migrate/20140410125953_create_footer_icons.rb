class CreateFooterIcons < ActiveRecord::Migration
  def change
    create_table :footer_icons do |t|
      t.string :name
      t.string :image
      t.string :link
      t.boolean :display, :default => true
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
