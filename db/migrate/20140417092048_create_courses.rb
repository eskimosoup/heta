class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :summary
      t.text :content
      t.float :individual_price
      t.float :group_price
      t.integer :min_place
      t.integer :max_place
      t.integer :min_group_number
      t.integer :max_group_number
      t.string :length
      t.boolean :bespoke, :default => false
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
