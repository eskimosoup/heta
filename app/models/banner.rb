class Banner < ActiveRecord::Base

  mount_uploader :image, BannerUploader
  validates :image, presence: true
end
