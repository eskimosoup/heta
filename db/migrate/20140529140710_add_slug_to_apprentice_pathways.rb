class AddSlugToApprenticePathways < ActiveRecord::Migration
  def change
    add_column :apprentice_pathways, :slug, :string
    add_index :apprentice_pathways, :slug
  end
end
