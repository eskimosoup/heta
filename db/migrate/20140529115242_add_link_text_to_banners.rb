class AddLinkTextToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :link_text, :string
  end
end
