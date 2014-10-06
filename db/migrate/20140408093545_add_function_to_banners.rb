class AddFunctionToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :position, :integer, :default => 0
    add_column :banners, :display, :boolean, :default => true
  end
end
