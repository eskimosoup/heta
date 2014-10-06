class AddDisplayToApprenticePathways < ActiveRecord::Migration
  def change
    add_column :apprentice_pathways, :display, :boolean, :default => true
  end
end
