class CreateApprentices < ActiveRecord::Migration
  def change
    create_table :apprentices do |t|
      t.string :name
      t.integer :company_id
      t.integer :apprentice_pathway_id
      t.text :snippet
      t.text :content
      t.boolean :highlight, :default => false
      t.string :image
      t.integer :position, :default => 0
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
