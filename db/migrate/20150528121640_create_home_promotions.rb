class CreateHomePromotions < ActiveRecord::Migration
  def change
    create_table :home_promotions do |t|
      t.string :title
      t.text :summary
      t.integer :position
      t.string :link
      t.boolean :display

      t.timestamps
    end
  end
end
