class AddUrlToDisplayToggles < ActiveRecord::Migration
  def change
    add_column :display_toggles, :url, :string, null: false
  end
end
