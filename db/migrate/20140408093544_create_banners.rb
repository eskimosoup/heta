class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :caption
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end
