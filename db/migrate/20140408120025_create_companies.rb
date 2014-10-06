class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :content
      t.string :image
      t.integer :position, :default => 0
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
