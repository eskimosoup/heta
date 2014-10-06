class CreateAppreticePathways < ActiveRecord::Migration
  def change
    create_table :apprentice_pathways do |t|
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
